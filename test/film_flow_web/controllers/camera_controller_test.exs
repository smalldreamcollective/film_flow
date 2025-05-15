defmodule FilmFlowWeb.CameraControllerTest do
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

  @invalid_attrs %{name: nil, model: nil, manufacturer_id: nil}

  describe "index" do
    test "lists all cameras", %{conn: conn} do
      conn = get(conn, ~p"/cameras")
      assert html_response(conn, 200) =~ "Listing Cameras"
    end
  end

  describe "new camera" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/cameras/new")
      assert html_response(conn, 200) =~ "New Camera"
    end
  end

  describe "create camera" do
    test "redirects to show when data is valid", %{conn: conn, manufacturer: manufacturer} do
      create_attrs = %{name: "some name", model: "some model", manufacturer_id: manufacturer.id}
      conn = post(conn, ~p"/cameras", camera: create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/cameras/#{id}"

      conn = get(conn, ~p"/cameras/#{id}")
      assert html_response(conn, 200) =~ "Camera #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/cameras", camera: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Camera"
    end
  end

  describe "edit camera" do
    setup [:create_camera_with_manufacturer]

    test "renders form for editing chosen camera", %{conn: conn, camera: camera} do
      conn = get(conn, ~p"/cameras/#{camera}/edit")
      assert html_response(conn, 200) =~ "Edit Camera"
    end
  end

  describe "update camera" do
    setup [:create_camera_with_manufacturer]

    test "redirects when data is valid", %{conn: conn, camera: camera, manufacturer: manufacturer} do
      update_attrs = %{
        name: "some updated name",
        model: "some updated model",
        manufacturer_id: manufacturer.id
      }

      conn = put(conn, ~p"/cameras/#{camera}", camera: update_attrs)
      assert redirected_to(conn) == ~p"/cameras/#{camera}"

      conn = get(conn, ~p"/cameras/#{camera}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, camera: camera} do
      conn = put(conn, ~p"/cameras/#{camera}", camera: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Camera"
    end
  end

  describe "delete camera" do
    setup [:create_camera_with_manufacturer]

    test "deletes chosen camera", %{conn: conn, camera: camera} do
      conn = delete(conn, ~p"/cameras/#{camera}")
      assert redirected_to(conn) == ~p"/cameras"

      assert_error_sent 404, fn ->
        get(conn, ~p"/cameras/#{camera}")
      end
    end
  end

  defp create_camera_with_manufacturer(_context) do
    manufacturer = manufacturer_fixture()
    camera = camera_fixture(%{manufacturer_id: manufacturer.id})
    %{camera: camera, manufacturer: manufacturer}
  end
end
