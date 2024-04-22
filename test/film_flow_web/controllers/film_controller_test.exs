defmodule FilmFlowWeb.FilmControllerTest do
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
    test "lists all film", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/film")
      assert html_response(conn, 200) =~ "Listing Film"
    end
  end

  describe "new film" do
    test "renders form", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/film/new")
      assert html_response(conn, 200) =~ "New Film"
    end
  end

  describe "create film" do
    test "redirects to show when data is valid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/film", film: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/film/#{id}"

      conn = get(conn, ~p"/film/#{id}")
      assert html_response(conn, 200) =~ "Film #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/film", film: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Film"
    end
  end

  describe "edit film" do
    setup [:create_film]

    test "renders form for editing chosen film", %{conn: conn, film: film, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/film/#{film}/edit")
      assert html_response(conn, 200) =~ "Edit Film"
    end
  end

  describe "update film" do
    setup [:create_film]

    test "redirects when data is valid", %{conn: conn, film: film, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/film/#{film}", film: @update_attrs)
      assert redirected_to(conn) == ~p"/film/#{film}"

      conn = get(conn, ~p"/film/#{film}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, film: film, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/film/#{film}", film: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Film"
    end
  end

  describe "delete film" do
    setup [:create_film]

    test "deletes chosen film", %{conn: conn, film: film, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = delete(conn, ~p"/film/#{film}")
      assert redirected_to(conn) == ~p"/film"

      assert_error_sent 404, fn ->
        get(conn, ~p"/film/#{film}")
      end
    end
  end

  defp create_film(_) do
    film = film_fixture()
    %{film: film}
  end
end
