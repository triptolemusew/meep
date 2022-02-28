defmodule Backend.Routes.GoogleAuth do
  import Plug.Conn

  alias Assent.Strategy.Google, as: GoogleOAuth
  alias Backend.Models.Users

  use Plug.Router

  plug(Plug.Session,
    store: :cookie,
    key: "meep_session",
    signing_salt: "abc"
  )

  plug(:match)
  plug(:dispatch)

  get "/" do
    config = config!()

    {:ok, %{url: url}} = GoogleOAuth.authorize_url(config)

    conn
    |> send_resp(200, url)
  end

  get "/callback" do
    conn_with_qp =
      conn
      |> fetch_query_params()
      |> fetch_session()

    config = config!()

    {:ok, %{user: user}} =
      config
      |> Assent.Config.put(:session_params, %{})
      |> GoogleOAuth.callback(conn_with_qp.query_params)

    %{
      "email" => email,
      "name" => name,
      "picture" => picture,
      "sub" => google_id
    } = user

    {_, db_user} =
      Users.google_find_or_create(%{
        google_id: google_id,
        email: email,
        username: email,
        name: name,
        avatar_url: picture
      })

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(%{user: db_user}))
  end

  defp config! do
    Application.get_env(:backend, :oauth)[:google] ++
      [
        redirect_uri: "http://localhost:4000/auth/google/callback",
        scope: "openid"
      ]
  end
end
