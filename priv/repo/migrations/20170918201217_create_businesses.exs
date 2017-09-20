defmodule BbApi.Repo.Migrations.CreateBusinesses do
  use Ecto.Migration

  def change do
    create table(:businesses) do
      add :name, :string
      add :episode_id, references(:episodes, on_delete: :delete_all)

      timestamps()
    end

    create index(:businesses, [:episode_id])
  end
end
