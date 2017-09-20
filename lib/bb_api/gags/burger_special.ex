defmodule BbApi.Gags.BurgerSpecial do
  use Ecto.Schema
  import Ecto.Changeset
  alias BbApi.Gags.BurgerSpecial


  schema "burger_specials" do
    field :name, :string
    field :episode_id, :id

    timestamps()
  end

  @doc false
  def changeset(%BurgerSpecial{} = burger_special, attrs) do
    burger_special
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
