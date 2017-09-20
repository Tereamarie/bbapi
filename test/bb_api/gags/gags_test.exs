defmodule BbApi.GagsTest do
  use BbApi.DataCase

  alias BbApi.Gags

  describe "businesses" do
    alias BbApi.Gags.Business

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def business_fixture(attrs \\ %{}) do
      {:ok, business} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Gags.create_business()

      business
    end

    test "list_businesses/0 returns all businesses" do
      business = business_fixture()
      assert Gags.list_businesses() == [business]
    end

    test "get_business!/1 returns the business with given id" do
      business = business_fixture()
      assert Gags.get_business!(business.id) == business
    end

    test "create_business/1 with valid data creates a business" do
      assert {:ok, %Business{} = business} = Gags.create_business(@valid_attrs)
      assert business.name == "some name"
    end

    test "create_business/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gags.create_business(@invalid_attrs)
    end

    test "update_business/2 with valid data updates the business" do
      business = business_fixture()
      assert {:ok, business} = Gags.update_business(business, @update_attrs)
      assert %Business{} = business
      assert business.name == "some updated name"
    end

    test "update_business/2 with invalid data returns error changeset" do
      business = business_fixture()
      assert {:error, %Ecto.Changeset{}} = Gags.update_business(business, @invalid_attrs)
      assert business == Gags.get_business!(business.id)
    end

    test "delete_business/1 deletes the business" do
      business = business_fixture()
      assert {:ok, %Business{}} = Gags.delete_business(business)
      assert_raise Ecto.NoResultsError, fn -> Gags.get_business!(business.id) end
    end

    test "change_business/1 returns a business changeset" do
      business = business_fixture()
      assert %Ecto.Changeset{} = Gags.change_business(business)
    end
  end

  describe "pest_control_vans" do
    alias BbApi.Gags.PestControlVan

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def pest_control_van_fixture(attrs \\ %{}) do
      {:ok, pest_control_van} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Gags.create_pest_control_van()

      pest_control_van
    end

    test "list_pest_control_vans/0 returns all pest_control_vans" do
      pest_control_van = pest_control_van_fixture()
      assert Gags.list_pest_control_vans() == [pest_control_van]
    end

    test "get_pest_control_van!/1 returns the pest_control_van with given id" do
      pest_control_van = pest_control_van_fixture()
      assert Gags.get_pest_control_van!(pest_control_van.id) == pest_control_van
    end

    test "create_pest_control_van/1 with valid data creates a pest_control_van" do
      assert {:ok, %PestControlVan{} = pest_control_van} = Gags.create_pest_control_van(@valid_attrs)
      assert pest_control_van.name == "some name"
    end

    test "create_pest_control_van/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gags.create_pest_control_van(@invalid_attrs)
    end

    test "update_pest_control_van/2 with valid data updates the pest_control_van" do
      pest_control_van = pest_control_van_fixture()
      assert {:ok, pest_control_van} = Gags.update_pest_control_van(pest_control_van, @update_attrs)
      assert %PestControlVan{} = pest_control_van
      assert pest_control_van.name == "some updated name"
    end

    test "update_pest_control_van/2 with invalid data returns error changeset" do
      pest_control_van = pest_control_van_fixture()
      assert {:error, %Ecto.Changeset{}} = Gags.update_pest_control_van(pest_control_van, @invalid_attrs)
      assert pest_control_van == Gags.get_pest_control_van!(pest_control_van.id)
    end

    test "delete_pest_control_van/1 deletes the pest_control_van" do
      pest_control_van = pest_control_van_fixture()
      assert {:ok, %PestControlVan{}} = Gags.delete_pest_control_van(pest_control_van)
      assert_raise Ecto.NoResultsError, fn -> Gags.get_pest_control_van!(pest_control_van.id) end
    end

    test "change_pest_control_van/1 returns a pest_control_van changeset" do
      pest_control_van = pest_control_van_fixture()
      assert %Ecto.Changeset{} = Gags.change_pest_control_van(pest_control_van)
    end
  end

  describe "burger_specials" do
    alias BbApi.Gags.BurgerSpecial

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def burger_special_fixture(attrs \\ %{}) do
      {:ok, burger_special} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Gags.create_burger_special()

      burger_special
    end

    test "list_burger_specials/0 returns all burger_specials" do
      burger_special = burger_special_fixture()
      assert Gags.list_burger_specials() == [burger_special]
    end

    test "get_burger_special!/1 returns the burger_special with given id" do
      burger_special = burger_special_fixture()
      assert Gags.get_burger_special!(burger_special.id) == burger_special
    end

    test "create_burger_special/1 with valid data creates a burger_special" do
      assert {:ok, %BurgerSpecial{} = burger_special} = Gags.create_burger_special(@valid_attrs)
      assert burger_special.name == "some name"
    end

    test "create_burger_special/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Gags.create_burger_special(@invalid_attrs)
    end

    test "update_burger_special/2 with valid data updates the burger_special" do
      burger_special = burger_special_fixture()
      assert {:ok, burger_special} = Gags.update_burger_special(burger_special, @update_attrs)
      assert %BurgerSpecial{} = burger_special
      assert burger_special.name == "some updated name"
    end

    test "update_burger_special/2 with invalid data returns error changeset" do
      burger_special = burger_special_fixture()
      assert {:error, %Ecto.Changeset{}} = Gags.update_burger_special(burger_special, @invalid_attrs)
      assert burger_special == Gags.get_burger_special!(burger_special.id)
    end

    test "delete_burger_special/1 deletes the burger_special" do
      burger_special = burger_special_fixture()
      assert {:ok, %BurgerSpecial{}} = Gags.delete_burger_special(burger_special)
      assert_raise Ecto.NoResultsError, fn -> Gags.get_burger_special!(burger_special.id) end
    end

    test "change_burger_special/1 returns a burger_special changeset" do
      burger_special = burger_special_fixture()
      assert %Ecto.Changeset{} = Gags.change_burger_special(burger_special)
    end
  end
end
