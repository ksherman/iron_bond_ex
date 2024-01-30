defmodule IronBond.Repo.Migrations.CreateUsersGroup do
  use Ecto.Migration

  def change do
    create table(:users_group, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :is_organizer, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :group_id, references(:groups, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:users_group, [:user_id])
    create index(:users_group, [:group_id])
  end
end
