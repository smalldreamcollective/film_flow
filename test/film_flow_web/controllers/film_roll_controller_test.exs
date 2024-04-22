defmodule FilmFlowWeb.FilmRollControllerTest do
  use FilmFlowWeb.ConnCase

  import FilmFlow.SettingsFixtures
  import FilmFlow.AccountsFixtures

  setup do
    %{user: user_fixture()}
  end

  @create_attrs %{name: "some name", description: "some description", reference_id: "some reference_id", frames: 42, expirate_date: ~U[2024-04-21 22:45:00Z]}
  @update_attrs %{name: "some updated name", description: "some updated description", reference_id: "some updated reference_id", frames: 43, expirate_date: ~U[2024-04-22 22:45:00Z]}
  @invalid_attrs %{name: nil, description: nil, reference_id: nil, frames: nil, expirate_date: nil}

  describe "index" do
    test "lists all film_rolls", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/film_rolls")
      assert html_response(conn, 200) =~ "Listing Film rolls"
    end
  end

  describe "new film_roll" do
    test "renders form", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/film_rolls/new")
      assert html_response(conn, 200) =~ "New Film roll"
    end
  end

  describe "create film_roll" do
    test "redirects to show when data is valid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/film_rolls", film_roll: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/film_rolls/#{id}"

      conn = get(conn, ~p"/film_rolls/#{id}")
      assert html_response(conn, 200) =~ "Film roll #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/film_rolls", film_roll: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Film roll"
    end
  end

  describe "edit film_roll" do
    setup [:create_film_roll]

    test "renders form for editing chosen film_roll", %{conn: conn, film_roll: film_roll, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/film_rolls/#{film_roll}/edit")
      assert html_response(conn, 200) =~ "Edit Film roll"
    end
  end

  describe "update film_roll" do
    setup [:create_film_roll]

    test "redirects when data is valid", %{conn: conn, film_roll: film_roll, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/film_rolls/#{film_roll}", film_roll: @update_attrs)
      assert redirected_to(conn) == ~p"/film_rolls/#{film_roll}"

      conn = get(conn, ~p"/film_rolls/#{film_roll}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, film_roll: film_roll, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/film_rolls/#{film_roll}", film_roll: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Film roll"
    end
  end

  describe "delete film_roll" do
    setup [:create_film_roll]

    test "deletes chosen film_roll", %{conn: conn, film_roll: film_roll, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = delete(conn, ~p"/film_rolls/#{film_roll}")
      assert redirected_to(conn) == ~p"/film_rolls"

      assert_error_sent 404, fn ->
        get(conn, ~p"/film_rolls/#{film_roll}")
      end
    end
  end

  defp create_film_roll(_) do
    film_roll = film_roll_fixture()
    %{film_roll: film_roll}
  end
end
