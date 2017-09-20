defmodule BbApi.CharactersTest do
  use BbApi.DataCase

  alias BbApi.Characters

  describe "characters" do
    alias BbApi.Characters.Character

    @valid_attrs %{name: "some name", profession: "some profession", sex: "some sex", voiced_by: "some voiced_by"}
    @update_attrs %{name: "some updated name", profession: "some updated profession", sex: "some updated sex", voiced_by: "some updated voiced_by"}
    @invalid_attrs %{name: nil, profession: nil, sex: nil, voiced_by: nil}

    def character_fixture(attrs \\ %{}) do
      {:ok, character} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Characters.create_character()

      character
    end

    test "list_characters/0 returns all characters" do
      character = character_fixture()
      assert Characters.list_characters() == [character]
    end

    test "get_character!/1 returns the character with given id" do
      character = character_fixture()
      assert Characters.get_character!(character.id) == character
    end

    test "create_character/1 with valid data creates a character" do
      assert {:ok, %Character{} = character} = Characters.create_character(@valid_attrs)
      assert character.name == "some name"
      assert character.profession == "some profession"
      assert character.sex == "some sex"
      assert character.voiced_by == "some voiced_by"
    end

    test "create_character/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Characters.create_character(@invalid_attrs)
    end

    test "update_character/2 with valid data updates the character" do
      character = character_fixture()
      assert {:ok, character} = Characters.update_character(character, @update_attrs)
      assert %Character{} = character
      assert character.name == "some updated name"
      assert character.profession == "some updated profession"
      assert character.sex == "some updated sex"
      assert character.voiced_by == "some updated voiced_by"
    end

    test "update_character/2 with invalid data returns error changeset" do
      character = character_fixture()
      assert {:error, %Ecto.Changeset{}} = Characters.update_character(character, @invalid_attrs)
      assert character == Characters.get_character!(character.id)
    end

    test "delete_character/1 deletes the character" do
      character = character_fixture()
      assert {:ok, %Character{}} = Characters.delete_character(character)
      assert_raise Ecto.NoResultsError, fn -> Characters.get_character!(character.id) end
    end

    test "change_character/1 returns a character changeset" do
      character = character_fixture()
      assert %Ecto.Changeset{} = Characters.change_character(character)
    end
  end
end
