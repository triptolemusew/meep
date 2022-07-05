defmodule Backend.Routes.User do
  import Plug.Conn

  alias Backend.Models.Users

  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/:username" do
    %Plug.Conn{params: %{"username" => username}} = conn

    user = Users.get_by_username(username)

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(
      200,
      Jason.encode!(%{user: user})
    )
  end
end
