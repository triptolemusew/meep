defmodule Backend.Endpoint do
  import Plug.Conn

  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get _ do
    send_resp(conn, 404, "not found")
  end

  post _ do
    send_resp(conn, 404, "not found")
  end
end
