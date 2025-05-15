defmodule FilmFlowWeb.FilterControllerTest do
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
    test "lists all filters", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/filters")
      assert html_response(conn, 200) =~ "Listing Filters"
    end
  end

  describe "new filter" do
    test "renders form", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/filters/new")
      assert html_response(conn, 200) =~ "New Filter"
    end
  end

  describe "create filter" do
    test "redirects to show when data is valid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/filters", filter: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/filters/#{id}"

      conn = get(conn, ~p"/filters/#{id}")
      assert html_response(conn, 200) =~ "Filter #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/filters", filter: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Filter"
    end
  end

  describe "edit filter" do
    setup [:create_filter]

    test "renders form for editing chosen filter", %{conn: conn, filter: filter, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/filters/#{filter}/edit")
      assert html_response(conn, 200) =~ "Edit Filter"
    end
  end

  describe "update filter" do
    setup [:create_filter]

    test "redirects when data is valid", %{conn: conn, filter: filter, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/filters/#{filter}", filter: @update_attrs)
      assert redirected_to(conn) == ~p"/filters/#{filter}"

      conn = get(conn, ~p"/filters/#{filter}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, filter: filter, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/filters/#{filter}", filter: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Filter"
    end
  end

  describe "delete filter" do
    setup [:create_filter]

    test "deletes chosen filter", %{conn: conn, filter: filter, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = delete(conn, ~p"/filters/#{filter}")
      assert redirected_to(conn) == ~p"/filters"

      assert_error_sent 404, fn ->
        get(conn, ~p"/filters/#{filter}")
      end
    end
  end

  defp create_filter(_) do
    filter = filter_fixture()
    %{filter: filter}
  end
end
