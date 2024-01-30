defmodule IronBond.UsersTest do
  use IronBond.DataCase

  alias IronBond.Users

  describe "users" do
    alias IronBond.Users.User

    import IronBond.UsersFixtures

    @invalid_attrs %{first: nil, last: nil, phone: nil, session_token: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Users.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{first: "some first", last: "some last", phone: 42, session_token: "some session_token"}

      assert {:ok, %User{} = user} = Users.create_user(valid_attrs)
      assert user.first == "some first"
      assert user.last == "some last"
      assert user.phone == 42
      assert user.session_token == "some session_token"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{first: "some updated first", last: "some updated last", phone: 43, session_token: "some updated session_token"}

      assert {:ok, %User{} = user} = Users.update_user(user, update_attrs)
      assert user.first == "some updated first"
      assert user.last == "some updated last"
      assert user.phone == 43
      assert user.session_token == "some updated session_token"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end
end
