defmodule BbApi.Repo.Migrations.CreateCharacters do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :name, :string
      add :sex, :string
      add :profession, :string
      add :voiced_by, :string

      timestamps()
    end

  end
end
