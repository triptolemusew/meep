defmodule Backend.DBSeeders do
  require Faker

  alias Backend.Schema.User
  alias Backend.Repo

  def insert_user do
    Repo.insert!(%User{
      name: Faker.Person.name(),
      username: Faker.Internet.user_name(),
      email: Faker.Internet.email(),
      avatar_url: Faker.Avatar.image_url()
    })
  end
end

Backend.DBSeeders.insert_user()
