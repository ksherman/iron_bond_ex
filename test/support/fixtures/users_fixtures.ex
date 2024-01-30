defmodule IronBond.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IronBond.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        first: "some first",
        last: "some last",
        phone: 42,
        session_token: "some session_token"
      })
      |> IronBond.Users.create_user()

    user
  end
end
