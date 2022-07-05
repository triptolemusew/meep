defmodule Backend.Endpoint do
  import Plug.Conn

  alias Backend.Routes.GoogleAuth
  alias Backend.Routes.User

  use Plug.Router

  plug(Backend.Plugs.Cors)
  plug(:match)
  plug(:dispatch)

  options _ do
    send_resp(conn, 200, "")
  end

  forward("/auth/google", to: GoogleAuth)
  forward("/user", to: User)

  get _ do
    send_resp(conn, 404, "not found")
  end

  post _ do
    send_resp(conn, 404, "not found")
  end
end
