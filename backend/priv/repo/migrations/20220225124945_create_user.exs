defmodule Backend.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :first_name, :string
      add :last_name, :string
      add :age, :integer
    end
  end
end
