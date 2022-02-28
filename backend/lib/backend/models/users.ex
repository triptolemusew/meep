defmodule Backend.Models.Users do
  import Ecto.Query, warn: false

  alias Backend.Schema.User
  alias Backend.Repo

  def bulk_insert(users) do
    Repo.insert_all(
      User,
      users,
      on_conflict: :nothing
    )
  end

  def google_find_or_create(user) do
    db_user =
      from(u in User,
        where: u.google_id == ^user.google_id,
        limit: 1
      )
      |> Repo.one()

    if db_user do
      if is_nil(db_user.google_id) do
        from(u in User,
          where: u.id == ^db_user.id,
          update: [
            set: [
              google_id: ^user.google_id
            ]
          ]
        )
        |> Repo.update_all([])
      end

      {:find, db_user}
    else
      {:create,
       Repo.insert!(%User{
         username: Backend.Utils.Random.big_ascii_id(),
         google_id: user.google_id,
         name: user.name,
         email: user.email,
         avatar_url: user.avatar_url
       })}
    end
  end

  def get_by_username(username) do
    from(u in User,
      where: u.username == ^username,
      limit: 1
    )
    |> Repo.one()
  end
end
