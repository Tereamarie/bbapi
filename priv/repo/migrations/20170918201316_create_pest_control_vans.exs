defmodule BbApi.Repo.Migrations.CreatePestControlVans do
  use Ecto.Migration

  def change do
    create table(:pest_control_vans) do
      add :name, :string
      add :episode_id, references(:episodes, on_delete: :delete_all)

      timestamps()
    end

    create index(:pest_control_vans, [:episode_id])
  end
end
