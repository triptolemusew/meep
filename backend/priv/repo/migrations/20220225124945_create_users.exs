defmodule Backend.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    execute("create extension if not exists \"uuid-ossp\";", "")

    create table(:users, primary_key: false) do
      add(:id, :uuid, primary_key: true, default: fragment("uuid_generate_v4()"))
      add(:name, :string, null: false)
      add(:username, :string, null: false)
      add(:email, :string, null: false)
      add(:avatar_url, :string, null: false)
      add(:google_id, :string)

      add(:inserted_at, :naive_datetime, null: false, default: fragment("now()"))
      add(:updated_at, :naive_datetime, null: false, default: fragment("now()"))
    end
  end
end
