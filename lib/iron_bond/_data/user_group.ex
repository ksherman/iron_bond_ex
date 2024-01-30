defmodule IronBond.UserGroup do
  @moduledoc """
  A many-to-many relationship between users and groups.
  """
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users_group" do
    field :is_organizer, :boolean, default: false
    field :user_id, :binary_id
    field :group_id, :binary_id
  end

  @doc false
  def changeset(user_group, attrs) do
    user_group
    |> cast(attrs, [:is_organizer])
    |> validate_required([:user_id, :group_id])
  end
end
