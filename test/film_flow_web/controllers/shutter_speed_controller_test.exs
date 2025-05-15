defmodule FilmFlowWeb.ShutterSpeedControllerTest do
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
    test "lists all shutter_speed", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/shutter_speed")
      assert html_response(conn, 200) =~ "Listing Shutter speed"
    end
  end

  describe "new shutter_speed" do
    test "renders form", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/shutter_speed/new")
      assert html_response(conn, 200) =~ "New Shutter speed"
    end
  end

  describe "create shutter_speed" do
    test "redirects to show when data is valid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/shutter_speed", shutter_speed: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/shutter_speed/#{id}"

      conn = get(conn, ~p"/shutter_speed/#{id}")
      assert html_response(conn, 200) =~ "Shutter speed #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/shutter_speed", shutter_speed: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Shutter speed"
    end
  end

  describe "edit shutter_speed" do
    setup [:create_shutter_speed]

    test "renders form for editing chosen shutter_speed", %{
      conn: conn,
      shutter_speed: shutter_speed,
      user: user
    } do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/shutter_speed/#{shutter_speed}/edit")
      assert html_response(conn, 200) =~ "Edit Shutter speed"
    end
  end

  describe "update shutter_speed" do
    setup [:create_shutter_speed]

    test "redirects when data is valid", %{conn: conn, shutter_speed: shutter_speed, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/shutter_speed/#{shutter_speed}", shutter_speed: @update_attrs)
      assert redirected_to(conn) == ~p"/shutter_speed/#{shutter_speed}"

      conn = get(conn, ~p"/shutter_speed/#{shutter_speed}")
      assert html_response(conn, 200) =~ "some updated value"
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      shutter_speed: shutter_speed,
      user: user
    } do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/shutter_speed/#{shutter_speed}", shutter_speed: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Shutter speed"
    end
  end

  describe "delete shutter_speed" do
    setup [:create_shutter_speed]

    test "deletes chosen shutter_speed", %{conn: conn, shutter_speed: shutter_speed, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = delete(conn, ~p"/shutter_speed/#{shutter_speed}")
      assert redirected_to(conn) == ~p"/shutter_speed"

      assert_error_sent 404, fn ->
        get(conn, ~p"/shutter_speed/#{shutter_speed}")
      end
    end
  end

  defp create_shutter_speed(_) do
    shutter_speed = shutter_speed_fixture()
    %{shutter_speed: shutter_speed}
  end
end
