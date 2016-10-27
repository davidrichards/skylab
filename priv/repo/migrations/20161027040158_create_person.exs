defmodule Skylab.Repo.Migrations.InitialMigration do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :name, :string
      add :age, :integer

      timestamps()
    end

    create table(:organizations) do
      add :name, :string

      timestamps()
    end

    create table(:positions) do
      add :title, :string
      add :organization_id, references(:organizations, on_delete: :nothing)
      add :person_id, references(:people, on_delete: :nothing)

      timestamps()
    end
    create index(:positions, [:organization_id])
    create index(:positions, [:person_id])
  end
end
