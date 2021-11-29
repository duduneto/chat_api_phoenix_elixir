defmodule Chat.DirectoryTest do
  use Chat.DataCase

  alias Chat.Directory

  describe "users" do
    alias Chat.Directory.User

    import Chat.DirectoryFixtures

    @invalid_attrs %{}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Directory.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Directory.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{}

      assert {:ok, %User{} = user} = Directory.create_user(valid_attrs)
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{}

      assert {:ok, %User{} = user} = Directory.update_user(user, update_attrs)
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_user(user, @invalid_attrs)
      assert user == Directory.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Directory.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Directory.change_user(user)
    end
  end

  describe "businesses" do
    alias Chat.Directory.Business

    import Chat.DirectoryFixtures

    @invalid_attrs %{description: nil, name: nil, tag: nil}

    test "list_businesses/0 returns all businesses" do
      business = business_fixture()
      assert Directory.list_businesses() == [business]
    end

    test "get_business!/1 returns the business with given id" do
      business = business_fixture()
      assert Directory.get_business!(business.id) == business
    end

    test "create_business/1 with valid data creates a business" do
      valid_attrs = %{description: "some description", name: "some name", tag: "some tag"}

      assert {:ok, %Business{} = business} = Directory.create_business(valid_attrs)
      assert business.description == "some description"
      assert business.name == "some name"
      assert business.tag == "some tag"
    end

    test "create_business/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Directory.create_business(@invalid_attrs)
    end

    test "update_business/2 with valid data updates the business" do
      business = business_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name", tag: "some updated tag"}

      assert {:ok, %Business{} = business} = Directory.update_business(business, update_attrs)
      assert business.description == "some updated description"
      assert business.name == "some updated name"
      assert business.tag == "some updated tag"
    end

    test "update_business/2 with invalid data returns error changeset" do
      business = business_fixture()
      assert {:error, %Ecto.Changeset{}} = Directory.update_business(business, @invalid_attrs)
      assert business == Directory.get_business!(business.id)
    end

    test "delete_business/1 deletes the business" do
      business = business_fixture()
      assert {:ok, %Business{}} = Directory.delete_business(business)
      assert_raise Ecto.NoResultsError, fn -> Directory.get_business!(business.id) end
    end

    test "change_business/1 returns a business changeset" do
      business = business_fixture()
      assert %Ecto.Changeset{} = Directory.change_business(business)
    end
  end
end
