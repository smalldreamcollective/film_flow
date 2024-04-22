defmodule FilmFlowWeb.ZoneControllerTest do
  use FilmFlowWeb.ConnCase

  import FilmFlow.SettingsFixtures
  import FilmFlow.AccountsFixtures

  setup do
    %{user: user_fixture()}
  end

  @create_attrs %{name: "some name", description: "some description"}
  @update_attrs %{name: "some updated name", description: "some updated description"}
  @invalid_attrs %{name: nil, description: nil}

  describe "index" do
    test "lists all zones", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/zones")
      assert html_response(conn, 200) =~ "Listing Zones"
    end
  end

  describe "new zone" do
    test "renders form", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/zones/new")
      assert html_response(conn, 200) =~ "New Zone"
    end
  end

  describe "create zone" do
    test "redirects to show when data is valid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/zones", zone: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/zones/#{id}"

      conn = get(conn, ~p"/zones/#{id}")
      assert html_response(conn, 200) =~ "Zone #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/zones", zone: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Zone"
    end
  end

  describe "edit zone" do
    setup [:create_zone]

    test "renders form for editing chosen zone", %{conn: conn, zone: zone, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/zones/#{zone}/edit")
      assert html_response(conn, 200) =~ "Edit Zone"
    end
  end

  describe "update zone" do
    setup [:create_zone]

    test "redirects when data is valid", %{conn: conn, zone: zone, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/zones/#{zone}", zone: @update_attrs)
      assert redirected_to(conn) == ~p"/zones/#{zone}"

      conn = get(conn, ~p"/zones/#{zone}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, zone: zone, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/zones/#{zone}", zone: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Zone"
    end
  end

  describe "delete zone" do
    setup [:create_zone]

    test "deletes chosen zone", %{conn: conn, zone: zone, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = delete(conn, ~p"/zones/#{zone}")
      assert redirected_to(conn) == ~p"/zones"

      assert_error_sent 404, fn ->
        get(conn, ~p"/zones/#{zone}")
      end
    end
  end

  defp create_zone(_) do
    zone = zone_fixture()
    %{zone: zone}
  end
end
