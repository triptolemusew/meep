defmodule Backend.Endpoint do
  @moduledoc """
  A Plug responsible for logging request info, parsing request body's as JSON,
  matching routes, and dispatching responses.
  """

  use Plug.Router

  # This module is a Plug, that also implements it's own plug pipeline, below:

  # Using Plug.Logger for logging request information
  plug(Plug.Logger)
  # Import functions used for matching routes
  plug(:match)
  # Using poison for JSON encoding
  # Note, order of plugs are important, by placing this _after_ the 'match' plug,
  # we will only parse the request AFTER there is route match.
  plug(Plug.Parsers, parsers: [:json], json_decoder: Poison)
  # Import functions used for dispatching responses
  plug(:dispatch)

  get "/ping" do
    send_resp(conn, 200, "Pong!")
  end

  get "/version" do
    resp =
      case :application.get_key(:backend, :vsn) do
        {:ok, vsn} -> vsn
        _ -> "version not found"
      end

    send_resp(conn, 200, resp)
  end

  # Handle incoming events, if the payload is the right shape, process the events,
  # otherwise return an error.
  post "/events" do
    {status, body} =
      case conn.body_params do
        %{"events" => events} -> {200, process_events(events)}
        _ -> {422, missing_events()}
      end

    send_resp(conn, status, body)
  end

  defp process_events(events) when is_list(events) do
    # Do some processing on a list of events
    Poison.encode!(%{response: "Received Events!"})
  end

  defp process_events(_) do
    # If we can't process anything, let them know
    Poison.encode!(%{response: "Please send some events!"})
  end

  def missing_events do
    Poison.encode!(%{error: "Expected payload: {'events': [...]}"})
  end

  # A catchall route, 'match' will match no matter the request method
  # so a response is always returned, even if there is no route to match
  match _ do
    send_resp(conn, 404, "smth went wrong")
  end
end
