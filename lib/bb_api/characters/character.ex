defmodule BbApi.Characters.Character do
  use Ecto.Schema
  import Ecto.Changeset
  alias BbApi.Characters.Character


  schema "characters" do
    field :name, :string
    field :profession, :string
    field :sex, :string
    field :voiced_by, :string

    timestamps()
  end

  @doc false
  def changeset(%Character{} = character, attrs) do
    character
    |> cast(attrs, [:name, :sex, :profession, :voiced_by])
    |> validate_required([:name, :sex, :profession, :voiced_by])
  end
end
