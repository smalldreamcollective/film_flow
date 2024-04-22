defmodule FilmFlowWeb.ApertureControllerTest do
  use FilmFlowWeb.ConnCase

  import FilmFlow.SettingsFixtures
  import FilmFlow.AccountsFixtures

  setup do
    %{user: user_fixture()}
  end

  @create_attrs %{value: "some value"}
  @update_attrs %{value: "some updated value"}
  @invalid_attrs %{value: nil}

  describe "index" do
    test "lists all aperture", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/aperture")
      assert html_response(conn, 200) =~ "Listing Aperture"
    end
  end

  describe "new aperture" do
    test "renders form", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/aperture/new")
      assert html_response(conn, 200) =~ "New Aperture"
    end
  end

  describe "create aperture" do
    test "redirects to show when data is valid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/aperture", aperture: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/aperture/#{id}"

      conn = get(conn, ~p"/aperture/#{id}")
      assert html_response(conn, 200) =~ "Aperture #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/aperture", aperture: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Aperture"
    end
  end

  describe "edit aperture" do
    setup [:create_aperture]

    test "renders form for editing chosen aperture", %{conn: conn, aperture: aperture, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/aperture/#{aperture}/edit")
      assert html_response(conn, 200) =~ "Edit Aperture"
    end
  end

  describe "update aperture" do
    setup [:create_aperture]

    test "redirects when data is valid", %{conn: conn, aperture: aperture, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/aperture/#{aperture}", aperture: @update_attrs)
      assert redirected_to(conn) == ~p"/aperture/#{aperture}"

      conn = get(conn, ~p"/aperture/#{aperture}")
      assert html_response(conn, 200) =~ "some updated value"
    end

    test "renders errors when data is invalid", %{conn: conn, aperture: aperture, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/aperture/#{aperture}", aperture: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Aperture"
    end
  end

  describe "delete aperture" do
    setup [:create_aperture]

    test "deletes chosen aperture", %{conn: conn, aperture: aperture, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = delete(conn, ~p"/aperture/#{aperture}")
      assert redirected_to(conn) == ~p"/aperture"

      assert_error_sent 404, fn ->
        get(conn, ~p"/aperture/#{aperture}")
      end
    end
  end

  defp create_aperture(_) do
    aperture = aperture_fixture()
    %{aperture: aperture}
  end
end
