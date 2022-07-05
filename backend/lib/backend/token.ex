defmodule Backend.Token do
  use Joken.Config

  def token_config do
    %{}
    |> add_claim("my_key", fn -> "custom claim" end, &(&1 == "custom claim"))
  end

  def decode(jwt_string, public_key) do
    # coming soon!

  end
end
