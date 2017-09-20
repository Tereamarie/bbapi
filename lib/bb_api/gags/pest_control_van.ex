defmodule BbApi.Gags.PestControlVan do
  use Ecto.Schema
  import Ecto.Changeset
  alias BbApi.Gags.PestControlVan


  schema "pest_control_vans" do
    field :name, :string
    field :episode_id, :id

    timestamps()
  end

  @doc false
  def changeset(%PestControlVan{} = pest_control_van, attrs) do
    pest_control_van
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
