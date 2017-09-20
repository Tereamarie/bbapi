defmodule BbApi.Gags do
  @moduledoc """
  The Gags context.
  """

  import Ecto.Query, warn: false
  alias BbApi.Repo

  alias BbApi.Gags.Business

  @doc """
  Returns the list of businesses.

  ## Examples

      iex> list_businesses()
      [%Business{}, ...]

  """
  def list_businesses do
    Repo.all(Business)
  end

  @doc """
  Gets a single business.

  Raises `Ecto.NoResultsError` if the Business does not exist.

  ## Examples

      iex> get_business!(123)
      %Business{}

      iex> get_business!(456)
      ** (Ecto.NoResultsError)

  """
  def get_business!(id), do: Repo.get!(Business, id)

  @doc """
  Creates a business.

  ## Examples

      iex> create_business(%{field: value})
      {:ok, %Business{}}

      iex> create_business(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_business(attrs \\ %{}) do
    %Business{}
    |> Business.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a business.

  ## Examples

      iex> update_business(business, %{field: new_value})
      {:ok, %Business{}}

      iex> update_business(business, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_business(%Business{} = business, attrs) do
    business
    |> Business.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Business.

  ## Examples

      iex> delete_business(business)
      {:ok, %Business{}}

      iex> delete_business(business)
      {:error, %Ecto.Changeset{}}

  """
  def delete_business(%Business{} = business) do
    Repo.delete(business)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking business changes.

  ## Examples

      iex> change_business(business)
      %Ecto.Changeset{source: %Business{}}

  """
  def change_business(%Business{} = business) do
    Business.changeset(business, %{})
  end

  alias BbApi.Gags.PestControlVan

  @doc """
  Returns the list of pest_control_vans.

  ## Examples

      iex> list_pest_control_vans()
      [%PestControlVan{}, ...]

  """
  def list_pest_control_vans do
    Repo.all(PestControlVan)
  end

  @doc """
  Gets a single pest_control_van.

  Raises `Ecto.NoResultsError` if the Pest control van does not exist.

  ## Examples

      iex> get_pest_control_van!(123)
      %PestControlVan{}

      iex> get_pest_control_van!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pest_control_van!(id), do: Repo.get!(PestControlVan, id)

  @doc """
  Creates a pest_control_van.

  ## Examples

      iex> create_pest_control_van(%{field: value})
      {:ok, %PestControlVan{}}

      iex> create_pest_control_van(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pest_control_van(attrs \\ %{}) do
    %PestControlVan{}
    |> PestControlVan.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pest_control_van.

  ## Examples

      iex> update_pest_control_van(pest_control_van, %{field: new_value})
      {:ok, %PestControlVan{}}

      iex> update_pest_control_van(pest_control_van, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pest_control_van(%PestControlVan{} = pest_control_van, attrs) do
    pest_control_van
    |> PestControlVan.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a PestControlVan.

  ## Examples

      iex> delete_pest_control_van(pest_control_van)
      {:ok, %PestControlVan{}}

      iex> delete_pest_control_van(pest_control_van)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pest_control_van(%PestControlVan{} = pest_control_van) do
    Repo.delete(pest_control_van)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pest_control_van changes.

  ## Examples

      iex> change_pest_control_van(pest_control_van)
      %Ecto.Changeset{source: %PestControlVan{}}

  """
  def change_pest_control_van(%PestControlVan{} = pest_control_van) do
    PestControlVan.changeset(pest_control_van, %{})
  end

  alias BbApi.Gags.BurgerSpecial

  @doc """
  Returns the list of burger_specials.

  ## Examples

      iex> list_burger_specials()
      [%BurgerSpecial{}, ...]

  """
  def list_burger_specials do
    Repo.all(BurgerSpecial)
  end

  @doc """
  Gets a single burger_special.

  Raises `Ecto.NoResultsError` if the Burger special does not exist.

  ## Examples

      iex> get_burger_special!(123)
      %BurgerSpecial{}

      iex> get_burger_special!(456)
      ** (Ecto.NoResultsError)

  """
  def get_burger_special!(id), do: Repo.get!(BurgerSpecial, id)

  @doc """
  Creates a burger_special.

  ## Examples

      iex> create_burger_special(%{field: value})
      {:ok, %BurgerSpecial{}}

      iex> create_burger_special(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_burger_special(attrs \\ %{}) do
    %BurgerSpecial{}
    |> BurgerSpecial.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a burger_special.

  ## Examples

      iex> update_burger_special(burger_special, %{field: new_value})
      {:ok, %BurgerSpecial{}}

      iex> update_burger_special(burger_special, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_burger_special(%BurgerSpecial{} = burger_special, attrs) do
    burger_special
    |> BurgerSpecial.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a BurgerSpecial.

  ## Examples

      iex> delete_burger_special(burger_special)
      {:ok, %BurgerSpecial{}}

      iex> delete_burger_special(burger_special)
      {:error, %Ecto.Changeset{}}

  """
  def delete_burger_special(%BurgerSpecial{} = burger_special) do
    Repo.delete(burger_special)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking burger_special changes.

  ## Examples

      iex> change_burger_special(burger_special)
      %Ecto.Changeset{source: %BurgerSpecial{}}

  """
  def change_burger_special(%BurgerSpecial{} = burger_special) do
    BurgerSpecial.changeset(burger_special, %{})
  end
end
