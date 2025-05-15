defmodule FilmFlowWeb.TripodControllerTest do
  use FilmFlowWeb.ConnCase

  import FilmFlow.SettingsFixtures
  import FilmFlow.AccountsFixtures

  setup %{conn: conn} do
    user = user_fixture()

    conn =
      post(conn, ~p"/users/log_in", %{
        "user" => %{"email" => user.email, "password" => valid_user_password()}
      })

    manufacturer = manufacturer_fixture()
    %{conn: conn, user: user, manufacturer: manufacturer}
  end

  @invalid_attrs %{description: nil, model: nil, manufacturer_id: nil, url_additional_info: nil}

  describe "index" do
    test "lists all tripods", %{conn: conn} do
      conn = get(conn, ~p"/tripods")
      assert html_response(conn, 200) =~ "Listing Tripods"
    end
  end

  describe "new tripod" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/tripods/new")
      assert html_response(conn, 200) =~ "New Tripod"
    end
  end

  describe "create tripod" do
    test "redirects to show when data is valid", %{conn: conn, manufacturer: manufacturer} do
      create_attrs = %{
        description: "some description",
        model: "some model",
        years: "some years",
        url_manual: "some url_manual",
        url_additional_info: "some url_additional_info",
        manufacturer_id: manufacturer.id
      }

      conn = post(conn, ~p"/tripods", tripod: create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/tripods/#{id}"

      conn = get(conn, ~p"/tripods/#{id}")
      assert html_response(conn, 200) =~ "Tripod #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/tripods", tripod: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Tripod"
    end
  end

  describe "edit tripod" do
    setup [:create_tripod_with_manufacturer]

    test "renders form for editing chosen tripod", %{conn: conn, tripod: tripod} do
      conn = get(conn, ~p"/tripods/#{tripod}/edit")
      assert html_response(conn, 200) =~ "Edit Tripod"
    end
  end

  describe "update tripod" do
    setup [:create_tripod_with_manufacturer]

    test "redirects when data is valid", %{conn: conn, tripod: tripod, manufacturer: manufacturer} do
      update_attrs = %{
        description: "some updated description",
        model: "some updated model",
        years: "some updated years",
        url_manual: "some updated url_manual",
        url_additional_info: "some updated url_additional_info",
        manufacturer_id: manufacturer.id
      }

      conn = put(conn, ~p"/tripods/#{tripod}", tripod: update_attrs)
      assert redirected_to(conn) == ~p"/tripods/#{tripod}"

      conn = get(conn, ~p"/tripods/#{tripod}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, tripod: tripod} do
      conn = put(conn, ~p"/tripods/#{tripod}", tripod: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Tripod"
    end
  end

  describe "delete tripod" do
    setup [:create_tripod_with_manufacturer]

    test "deletes chosen tripod", %{conn: conn, tripod: tripod} do
      conn = delete(conn, ~p"/tripods/#{tripod}")
      assert redirected_to(conn) == ~p"/tripods"

      assert_error_sent 404, fn ->
        get(conn, ~p"/tripods/#{tripod}")
      end
    end
  end

  defp create_tripod_with_manufacturer(_context) do
    manufacturer = manufacturer_fixture()

    tripod =
      tripod_fixture(%{manufacturer_id: manufacturer.id, url_additional_info: "valid info"})

    %{tripod: tripod, manufacturer: manufacturer}
  end
end
