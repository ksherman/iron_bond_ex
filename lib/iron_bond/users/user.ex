defmodule IronBond.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :first, :string
    field :last, :string
    field :phone, :integer
    field :session_token, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first, :last, :phone, :session_token])
    |> validate_required([:first, :last, :phone, :session_token])
  end
end
