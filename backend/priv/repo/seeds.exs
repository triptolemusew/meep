defmodule Backend.DBSeeders do
  require Faker

  alias Backend.User
  alias Backend.Repo

  def insert_user do
    Repo.insert!(
      %User{
        first_name: Faker.Person.first_name(),
        last_name: Faker.Person.last_name(),
        age: Faker.random_between(20, 30),
      }
    )
  end
end

Backend.DBSeeders.insert_user()
