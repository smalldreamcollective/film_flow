defmodule FilmFlowWeb.FilmBackControllerTest do
  use FilmFlowWeb.ConnCase

  import FilmFlow.SettingsFixtures
  import FilmFlow.AccountsFixtures

  setup do
    %{user: user_fixture()}
  end

  @create_attrs %{
    description: "some description",
    model: "some model",
    years: "some years",
    url_manual: "some url_manual",
    url_additional_info: "some url_additional_info"
  }
  @update_attrs %{
    description: "some updated description",
    model: "some updated model",
    years: "some updated years",
    url_manual: "some updated url_manual",
    url_additional_info: "some updated url_additional_info"
  }
  @invalid_attrs %{
    description: nil,
    model: nil,
    years: nil,
    url_manual: nil,
    url_additional_info: nil
  }

  describe "index" do
    test "lists all film_backs", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/film_backs")
      assert html_response(conn, 200) =~ "Listing Film backs"
    end
  end

  describe "new film_back" do
    test "renders form", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/film_backs/new")
      assert html_response(conn, 200) =~ "New Film back"
    end
  end

  describe "create film_back" do
    test "redirects to show when data is valid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/film_backs", film_back: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/film_backs/#{id}"

      conn = get(conn, ~p"/film_backs/#{id}")
      assert html_response(conn, 200) =~ "Film back #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/film_backs", film_back: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Film back"
    end
  end

  describe "edit film_back" do
    setup [:create_film_back]

    test "renders form for editing chosen film_back", %{
      conn: conn,
      film_back: film_back,
      user: user
    } do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/film_backs/#{film_back}/edit")
      assert html_response(conn, 200) =~ "Edit Film back"
    end
  end

  describe "update film_back" do
    setup [:create_film_back]

    test "redirects when data is valid", %{conn: conn, film_back: film_back, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/film_backs/#{film_back}", film_back: @update_attrs)
      assert redirected_to(conn) == ~p"/film_backs/#{film_back}"

      conn = get(conn, ~p"/film_backs/#{film_back}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, film_back: film_back, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/film_backs/#{film_back}", film_back: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Film back"
    end
  end

  describe "delete film_back" do
    setup [:create_film_back]

    test "deletes chosen film_back", %{conn: conn, film_back: film_back, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = delete(conn, ~p"/film_backs/#{film_back}")
      assert redirected_to(conn) == ~p"/film_backs"

      assert_error_sent 404, fn ->
        get(conn, ~p"/film_backs/#{film_back}")
      end
    end
  end

  defp create_film_back(_) do
    film_back = film_back_fixture()
    %{film_back: film_back}
  end
end
