defmodule FilmFlowWeb.ManufacturerControllerTest do
  use FilmFlowWeb.ConnCase

  import FilmFlow.SettingsFixtures
  import FilmFlow.AccountsFixtures

  setup do
    %{user: user_fixture()}
  end

  @create_attrs %{name: "some name", url: "some url"}
  @update_attrs %{name: "some updated name", url: "some updated url"}
  @invalid_attrs %{name: nil, url: nil}

  describe "index" do
    test "lists all manufacturers", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/manufacturers")
      assert html_response(conn, 200) =~ "Listing Manufacturers"
    end
  end

  describe "new manufacturer" do
    test "renders form", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/manufacturers/new")
      assert html_response(conn, 200) =~ "New Manufacturer"
    end
  end

  describe "create manufacturer" do
    test "redirects to show when data is valid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/manufacturers", manufacturer: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/manufacturers/#{id}"

      conn = get(conn, ~p"/manufacturers/#{id}")
      assert html_response(conn, 200) =~ "Manufacturer #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/manufacturers", manufacturer: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Manufacturer"
    end
  end

  describe "edit manufacturer" do
    setup [:create_manufacturer]

    test "renders form for editing chosen manufacturer", %{
      conn: conn,
      manufacturer: manufacturer,
      user: user
    } do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/manufacturers/#{manufacturer}/edit")
      assert html_response(conn, 200) =~ "Edit Manufacturer"
    end
  end

  describe "update manufacturer" do
    setup [:create_manufacturer]

    test "redirects when data is valid", %{conn: conn, manufacturer: manufacturer, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/manufacturers/#{manufacturer}", manufacturer: @update_attrs)
      assert redirected_to(conn) == ~p"/manufacturers/#{manufacturer}"

      conn = get(conn, ~p"/manufacturers/#{manufacturer}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      manufacturer: manufacturer,
      user: user
    } do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/manufacturers/#{manufacturer}", manufacturer: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Manufacturer"
    end
  end

  describe "delete manufacturer" do
    setup [:create_manufacturer]

    test "deletes chosen manufacturer", %{conn: conn, manufacturer: manufacturer, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = delete(conn, ~p"/manufacturers/#{manufacturer}")
      assert redirected_to(conn) == ~p"/manufacturers"

      assert_error_sent 404, fn ->
        get(conn, ~p"/manufacturers/#{manufacturer}")
      end
    end
  end

  defp create_manufacturer(_) do
    manufacturer = manufacturer_fixture()
    %{manufacturer: manufacturer}
  end
end
