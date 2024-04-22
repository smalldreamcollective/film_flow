defmodule FilmFlowWeb.PhotographerControllerTest do
  use FilmFlowWeb.ConnCase

  import FilmFlow.SettingsFixtures
  import FilmFlow.AccountsFixtures

  setup do
    %{user: user_fixture()}
  end

  @create_attrs %{first_name: "some first_name", middle_name: "some middle_name", last_name: "some last_name"}
  @update_attrs %{first_name: "some updated first_name", middle_name: "some updated middle_name", last_name: "some updated last_name"}
  @invalid_attrs %{first_name: nil, middle_name: nil, last_name: nil}

  describe "index" do
    test "lists all photographers", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/photographers")
      assert html_response(conn, 200) =~ "Listing Photographers"
    end
  end

  describe "new photographer" do
    test "renders form", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/photographers/new")
      assert html_response(conn, 200) =~ "New Photographer"
    end
  end

  describe "create photographer" do
    test "redirects to show when data is valid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/photographers", photographer: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/photographers/#{id}"

      conn = get(conn, ~p"/photographers/#{id}")
      assert html_response(conn, 200) =~ "Photographer #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/photographers", photographer: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Photographer"
    end
  end

  describe "edit photographer" do
    setup [:create_photographer]

    test "renders form for editing chosen photographer", %{conn: conn, photographer: photographer, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/photographers/#{photographer}/edit")
      assert html_response(conn, 200) =~ "Edit Photographer"
    end
  end

  describe "update photographer" do
    setup [:create_photographer]

    test "redirects when data is valid", %{conn: conn, photographer: photographer, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/photographers/#{photographer}", photographer: @update_attrs)
      assert redirected_to(conn) == ~p"/photographers/#{photographer}"

      conn = get(conn, ~p"/photographers/#{photographer}")
      assert html_response(conn, 200) =~ "some updated first_name"
    end

    test "renders errors when data is invalid", %{conn: conn, photographer: photographer, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/photographers/#{photographer}", photographer: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Photographer"
    end
  end

  describe "delete photographer" do
    setup [:create_photographer]

    test "deletes chosen photographer", %{conn: conn, photographer: photographer, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = delete(conn, ~p"/photographers/#{photographer}")
      assert redirected_to(conn) == ~p"/photographers"

      assert_error_sent 404, fn ->
        get(conn, ~p"/photographers/#{photographer}")
      end
    end
  end

  defp create_photographer(_) do
    photographer = photographer_fixture()
    %{photographer: photographer}
  end
end
