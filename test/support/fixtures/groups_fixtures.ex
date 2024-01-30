defmodule IronBond.GroupsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `IronBond.Groups` context.
  """

  @doc """
  Generate a group.
  """
  def group_fixture(attrs \\ %{}) do
    {:ok, group} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> IronBond.Groups.create_group()

    group
  end
end
