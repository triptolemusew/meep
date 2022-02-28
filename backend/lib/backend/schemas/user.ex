defmodule Backend.Schema.User do
  use Ecto.Schema

  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:id, :name, :username, :email]}

  @type t :: %__MODULE__{
          id: Ecto.UUID.t(),
          username: String.t(),
          name: String.t(),
          email: String.t(),
          avatar_url: String.t(),
          google_id: String.t()
        }

  @primary_key {:id, :binary_id, []}
  schema "users" do
    field(:name, :string)
    field(:username, :string)
    field(:email, :string)
    field(:avatar_url, :string)
    field(:google_id, :string)

    timestamps()
  end

  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [:name, :username, :email, :avatarUrl])
    |> validate_required([:username, :email])
  end
end
