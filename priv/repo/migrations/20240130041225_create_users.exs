defmodule IronBond.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :first, :string
      add :last, :string
      add :phone, :string

      timestamps(type: :utc_datetime)
    end

    create table(:groups, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :start_date, :date
      add :end_date, :date

      timestamps(type: :utc_datetime)
    end

    create table(:users_group, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :is_organizer, :boolean, default: false, null: false
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)
      add :group_id, references(:groups, on_delete: :nothing, type: :binary_id)
    end

    create index(:users_group, [:user_id])
    create index(:users_group, [:group_id])
    create unique_index(:users, [:phone])
  end
end
