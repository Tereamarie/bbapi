defmodule BbApi.Gags.Business do
  use Ecto.Schema
  import Ecto.Changeset
  alias BbApi.Gags.Business


  schema "businesses" do
    field :name, :string
    field :episode_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Business{} = business, attrs) do
    business
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
