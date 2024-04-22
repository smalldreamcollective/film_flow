defmodule FilmFlowWeb.TripodControllerTest do
  use FilmFlowWeb.ConnCase

  import FilmFlow.SettingsFixtures
  import FilmFlow.AccountsFixtures

  setup do
    %{user: user_fixture()}
  end

  @create_attrs %{description: "some description", model: "some model", years: "some years", url_manual: "some url_manual", url_addtional_info: "some url_addtional_info"}
  @update_attrs %{description: "some updated description", model: "some updated model", years: "some updated years", url_manual: "some updated url_manual", url_addtional_info: "some updated url_addtional_info"}
  @invalid_attrs %{description: nil, model: nil, years: nil, url_manual: nil, url_addtional_info: nil}

  describe "index" do
    test "lists all tripods", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/tripods")
      assert html_response(conn, 200) =~ "Listing Tripods"
    end
  end

  describe "new tripod" do
    test "renders form", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/tripods/new")
      assert html_response(conn, 200) =~ "New Tripod"
    end
  end

  describe "create tripod" do
    test "redirects to show when data is valid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/tripods", tripod: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/tripods/#{id}"

      conn = get(conn, ~p"/tripods/#{id}")
      assert html_response(conn, 200) =~ "Tripod #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/tripods", tripod: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Tripod"
    end
  end

  describe "edit tripod" do
    setup [:create_tripod]

    test "renders form for editing chosen tripod", %{conn: conn, tripod: tripod, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/tripods/#{tripod}/edit")
      assert html_response(conn, 200) =~ "Edit Tripod"
    end
  end

  describe "update tripod" do
    setup [:create_tripod]

    test "redirects when data is valid", %{conn: conn, tripod: tripod, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/tripods/#{tripod}", tripod: @update_attrs)
      assert redirected_to(conn) == ~p"/tripods/#{tripod}"

      conn = get(conn, ~p"/tripods/#{tripod}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, tripod: tripod, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/tripods/#{tripod}", tripod: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Tripod"
    end
  end

  describe "delete tripod" do
    setup [:create_tripod]

    test "deletes chosen tripod", %{conn: conn, tripod: tripod, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = delete(conn, ~p"/tripods/#{tripod}")
      assert redirected_to(conn) == ~p"/tripods"

      assert_error_sent 404, fn ->
        get(conn, ~p"/tripods/#{tripod}")
      end
    end
  end

  defp create_tripod(_) do
    tripod = tripod_fixture()
    %{tripod: tripod}
  end
end
