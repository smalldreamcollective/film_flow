defmodule FilmFlowWeb.FormatControllerTest do
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
    test "lists all format", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/format")
      assert html_response(conn, 200) =~ "Listing Format"
    end
  end

  describe "new format" do
    test "renders form", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/format/new")
      assert html_response(conn, 200) =~ "New Format"
    end
  end

  describe "create format" do
    test "redirects to show when data is valid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/format", format: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/format/#{id}"

      conn = get(conn, ~p"/format/#{id}")
      assert html_response(conn, 200) =~ "Format #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/format", format: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Format"
    end
  end

  describe "edit format" do
    setup [:create_format]

    test "renders form for editing chosen format", %{conn: conn, format: format, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/format/#{format}/edit")
      assert html_response(conn, 200) =~ "Edit Format"
    end
  end

  describe "update format" do
    setup [:create_format]

    test "redirects when data is valid", %{conn: conn, format: format, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/format/#{format}", format: @update_attrs)
      assert redirected_to(conn) == ~p"/format/#{format}"

      conn = get(conn, ~p"/format/#{format}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, format: format, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/format/#{format}", format: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Format"
    end
  end

  describe "delete format" do
    setup [:create_format]

    test "deletes chosen format", %{conn: conn, format: format, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = delete(conn, ~p"/format/#{format}")
      assert redirected_to(conn) == ~p"/format"

      assert_error_sent 404, fn ->
        get(conn, ~p"/format/#{format}")
      end
    end
  end

  defp create_format(_) do
    format = format_fixture()
    %{format: format}
  end
end
