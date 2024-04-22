defmodule FilmFlowWeb.ExposureControllerTest do
  use FilmFlowWeb.ConnCase

  import FilmFlow.SettingsFixtures
  import FilmFlow.AccountsFixtures

  setup do
    %{user: user_fixture()}
  end

  @create_attrs %{frame: 42, subject: "some subject", date_exposed: ~U[2024-04-21 23:04:00Z], lighting_condition: "some lighting_condition", notes: "some notes"}
  @update_attrs %{frame: 43, subject: "some updated subject", date_exposed: ~U[2024-04-22 23:04:00Z], lighting_condition: "some updated lighting_condition", notes: "some updated notes"}
  @invalid_attrs %{frame: nil, subject: nil, date_exposed: nil, lighting_condition: nil, notes: nil}

  describe "index" do
    test "lists all exposures", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/exposures")
      assert html_response(conn, 200) =~ "Listing Exposures"
    end
  end

  describe "new exposure" do
    test "renders form", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/exposures/new")
      assert html_response(conn, 200) =~ "New Exposure"
    end
  end

  describe "create exposure" do
    test "redirects to show when data is valid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/exposures", exposure: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/exposures/#{id}"

      conn = get(conn, ~p"/exposures/#{id}")
      assert html_response(conn, 200) =~ "Exposure #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/exposures", exposure: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Exposure"
    end
  end

  describe "edit exposure" do
    setup [:create_exposure]

    test "renders form for editing chosen exposure", %{conn: conn, exposure: exposure, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/exposures/#{exposure}/edit")
      assert html_response(conn, 200) =~ "Edit Exposure"
    end
  end

  describe "update exposure" do
    setup [:create_exposure]

    test "redirects when data is valid", %{conn: conn, exposure: exposure, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/exposures/#{exposure}", exposure: @update_attrs)
      assert redirected_to(conn) == ~p"/exposures/#{exposure}"

      conn = get(conn, ~p"/exposures/#{exposure}")
      assert html_response(conn, 200) =~ "some updated subject"
    end

    test "renders errors when data is invalid", %{conn: conn, exposure: exposure, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/exposures/#{exposure}", exposure: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Exposure"
    end
  end

  describe "delete exposure" do
    setup [:create_exposure]

    test "deletes chosen exposure", %{conn: conn, exposure: exposure, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = delete(conn, ~p"/exposures/#{exposure}")
      assert redirected_to(conn) == ~p"/exposures"

      assert_error_sent 404, fn ->
        get(conn, ~p"/exposures/#{exposure}")
      end
    end
  end

  defp create_exposure(_) do
    exposure = exposure_fixture()
    %{exposure: exposure}
  end
end
