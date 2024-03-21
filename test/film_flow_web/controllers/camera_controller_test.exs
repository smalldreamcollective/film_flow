defmodule FilmFlowWeb.CameraControllerTest do
  use FilmFlowWeb.ConnCase

  import FilmFlow.SettingsFixtures

  @create_attrs %{name: "some name", brand: "some brand", model: "some model"}
  @update_attrs %{name: "some updated name", brand: "some updated brand", model: "some updated model"}
  @invalid_attrs %{name: nil, brand: nil, model: nil}

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
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/cameras", camera: @create_attrs)

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
    setup [:create_camera]

    test "renders form for editing chosen camera", %{conn: conn, camera: camera} do
      conn = get(conn, ~p"/cameras/#{camera}/edit")
      assert html_response(conn, 200) =~ "Edit Camera"
    end
  end

  describe "update camera" do
    setup [:create_camera]

    test "redirects when data is valid", %{conn: conn, camera: camera} do
      conn = put(conn, ~p"/cameras/#{camera}", camera: @update_attrs)
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
    setup [:create_camera]

    test "deletes chosen camera", %{conn: conn, camera: camera} do
      conn = delete(conn, ~p"/cameras/#{camera}")
      assert redirected_to(conn) == ~p"/cameras"

      assert_error_sent 404, fn ->
        get(conn, ~p"/cameras/#{camera}")
      end
    end
  end

  defp create_camera(_) do
    camera = camera_fixture()
    %{camera: camera}
  end
end
