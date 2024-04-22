defmodule FilmFlowWeb.ExposureRecordControllerTest do
  use FilmFlowWeb.ConnCase

  import FilmFlow.SettingsFixtures
  import FilmFlow.AccountsFixtures

  setup do
    %{user: user_fixture()}
  end

  @create_attrs %{reference_id: "some reference_id", project_name: "some project_name", date_loaded: ~U[2024-04-21 21:57:00Z], date_exposed: ~U[2024-04-21 21:57:00Z], concept: "some concept"}
  @update_attrs %{reference_id: "some updated reference_id", project_name: "some updated project_name", date_loaded: ~U[2024-04-22 21:57:00Z], date_exposed: ~U[2024-04-22 21:57:00Z], concept: "some updated concept"}
  @invalid_attrs %{reference_id: nil, project_name: nil, date_loaded: nil, date_exposed: nil, concept: nil}

  describe "index" do
    test "lists all exposure_records", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/exposure_records")
      assert html_response(conn, 200) =~ "Listing Exposure records"
    end
  end

  describe "new exposure_record" do
    test "renders form", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/exposure_records/new")
      assert html_response(conn, 200) =~ "New Exposure record"
    end
  end

  describe "create exposure_record" do
    test "redirects to show when data is valid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/exposure_records", exposure_record: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/exposure_records/#{id}"

      conn = get(conn, ~p"/exposure_records/#{id}")
      assert html_response(conn, 200) =~ "Exposure record #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/exposure_records", exposure_record: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Exposure record"
    end
  end

  describe "edit exposure_record" do
    setup [:create_exposure_record]

    test "renders form for editing chosen exposure_record", %{conn: conn, exposure_record: exposure_record, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/exposure_records/#{exposure_record}/edit")
      assert html_response(conn, 200) =~ "Edit Exposure record"
    end
  end

  describe "update exposure_record" do
    setup [:create_exposure_record]

    test "redirects when data is valid", %{conn: conn, exposure_record: exposure_record, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/exposure_records/#{exposure_record}", exposure_record: @update_attrs)
      assert redirected_to(conn) == ~p"/exposure_records/#{exposure_record}"

      conn = get(conn, ~p"/exposure_records/#{exposure_record}")
      assert html_response(conn, 200) =~ "some updated reference_id"
    end

    test "renders errors when data is invalid", %{conn: conn, exposure_record: exposure_record, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/exposure_records/#{exposure_record}", exposure_record: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Exposure record"
    end
  end

  describe "delete exposure_record" do
    setup [:create_exposure_record]

    test "deletes chosen exposure_record", %{conn: conn, exposure_record: exposure_record, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = delete(conn, ~p"/exposure_records/#{exposure_record}")
      assert redirected_to(conn) == ~p"/exposure_records"

      assert_error_sent 404, fn ->
        get(conn, ~p"/exposure_records/#{exposure_record}")
      end
    end
  end

  defp create_exposure_record(_) do
    exposure_record = exposure_record_fixture()
    %{exposure_record: exposure_record}
  end
end
