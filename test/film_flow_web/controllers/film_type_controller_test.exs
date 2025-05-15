defmodule FilmFlowWeb.FilmTypeControllerTest do
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
    test "lists all film_type", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/film_type")
      assert html_response(conn, 200) =~ "Listing Film type"
    end
  end

  describe "new film_type" do
    test "renders form", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/film_type/new")
      assert html_response(conn, 200) =~ "New Film type"
    end
  end

  describe "create film_type" do
    test "redirects to show when data is valid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/film_type", film_type: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/film_type/#{id}"

      conn = get(conn, ~p"/film_type/#{id}")
      assert html_response(conn, 200) =~ "Film type #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/film_type", film_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Film type"
    end
  end

  describe "edit film_type" do
    setup [:create_film_type]

    test "renders form for editing chosen film_type", %{
      conn: conn,
      film_type: film_type,
      user: user
    } do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/film_type/#{film_type}/edit")
      assert html_response(conn, 200) =~ "Edit Film type"
    end
  end

  describe "update film_type" do
    setup [:create_film_type]

    test "redirects when data is valid", %{conn: conn, film_type: film_type, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/film_type/#{film_type}", film_type: @update_attrs)
      assert redirected_to(conn) == ~p"/film_type/#{film_type}"

      conn = get(conn, ~p"/film_type/#{film_type}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, film_type: film_type, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/film_type/#{film_type}", film_type: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Film type"
    end
  end

  describe "delete film_type" do
    setup [:create_film_type]

    test "deletes chosen film_type", %{conn: conn, film_type: film_type, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = delete(conn, ~p"/film_type/#{film_type}")
      assert redirected_to(conn) == ~p"/film_type"

      assert_error_sent 404, fn ->
        get(conn, ~p"/film_type/#{film_type}")
      end
    end
  end

  defp create_film_type(_) do
    film_type = film_type_fixture()
    %{film_type: film_type}
  end
end
