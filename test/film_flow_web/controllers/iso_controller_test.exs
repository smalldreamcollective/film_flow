defmodule FilmFlowWeb.ISOControllerTest do
  use FilmFlowWeb.ConnCase

  import FilmFlow.SettingsFixtures
  import FilmFlow.AccountsFixtures

  setup do
    %{user: user_fixture()}
  end

  @create_attrs %{value: "some value", description: "some description"}
  @update_attrs %{value: "some updated value", description: "some updated description"}
  @invalid_attrs %{value: nil, description: nil}

  describe "index" do
    test "lists all iso", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/iso")
      assert html_response(conn, 200) =~ "Listing Iso"
    end
  end

  describe "new iso" do
    test "renders form", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/iso/new")
      assert html_response(conn, 200) =~ "New Iso"
    end
  end

  describe "create iso" do
    test "redirects to show when data is valid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/iso", iso: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/iso/#{id}"

      conn = get(conn, ~p"/iso/#{id}")
      assert html_response(conn, 200) =~ "Iso #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/iso", iso: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Iso"
    end
  end

  describe "edit iso" do
    setup [:create_iso]

    test "renders form for editing chosen iso", %{conn: conn, iso: iso, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/iso/#{iso}/edit")
      assert html_response(conn, 200) =~ "Edit Iso"
    end
  end

  describe "update iso" do
    setup [:create_iso]

    test "redirects when data is valid", %{conn: conn, iso: iso, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/iso/#{iso}", iso: @update_attrs)
      assert redirected_to(conn) == ~p"/iso/#{iso}"

      conn = get(conn, ~p"/iso/#{iso}")
      assert html_response(conn, 200) =~ "some updated value"
    end

    test "renders errors when data is invalid", %{conn: conn, iso: iso, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/iso/#{iso}", iso: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Iso"
    end
  end

  describe "delete iso" do
    setup [:create_iso]

    test "deletes chosen iso", %{conn: conn, iso: iso, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = delete(conn, ~p"/iso/#{iso}")
      assert redirected_to(conn) == ~p"/iso"

      assert_error_sent 404, fn ->
        get(conn, ~p"/iso/#{iso}")
      end
    end
  end

  defp create_iso(_) do
    iso = iso_fixture()
    %{iso: iso}
  end
end
