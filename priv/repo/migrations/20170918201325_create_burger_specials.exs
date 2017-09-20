defmodule BbApi.Repo.Migrations.CreateBurgerSpecials do
  use Ecto.Migration

  def change do
    create table(:burger_specials) do
      add :name, :string
      add :episode_id, references(:episodes, on_delete: :delete_all)

      timestamps()
    end

    create index(:burger_specials, [:episode_id])
  end
end
