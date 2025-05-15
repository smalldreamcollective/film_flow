defmodule FilmFlowWeb.HolderControllerTest do
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
    test "lists all holders", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/holders")
      assert html_response(conn, 200) =~ "Listing Holders"
    end
  end

  describe "new holder" do
    test "renders form", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/holders/new")
      assert html_response(conn, 200) =~ "New Holder"
    end
  end

  describe "create holder" do
    test "redirects to show when data is valid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/holders", holder: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/holders/#{id}"

      conn = get(conn, ~p"/holders/#{id}")
      assert html_response(conn, 200) =~ "Holder #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/holders", holder: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Holder"
    end
  end

  describe "edit holder" do
    setup [:create_holder]

    test "renders form for editing chosen holder", %{conn: conn, holder: holder, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/holders/#{holder}/edit")
      assert html_response(conn, 200) =~ "Edit Holder"
    end
  end

  describe "update holder" do
    setup [:create_holder]

    test "redirects when data is valid", %{conn: conn, holder: holder, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/holders/#{holder}", holder: @update_attrs)
      assert redirected_to(conn) == ~p"/holders/#{holder}"

      conn = get(conn, ~p"/holders/#{holder}")
      assert html_response(conn, 200) =~ "some updated description"
    end

    test "renders errors when data is invalid", %{conn: conn, holder: holder, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/holders/#{holder}", holder: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Holder"
    end
  end

  describe "delete holder" do
    setup [:create_holder]

    test "deletes chosen holder", %{conn: conn, holder: holder, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = delete(conn, ~p"/holders/#{holder}")
      assert redirected_to(conn) == ~p"/holders"

      assert_error_sent 404, fn ->
        get(conn, ~p"/holders/#{holder}")
      end
    end
  end

  defp create_holder(_) do
    holder = holder_fixture()
    %{holder: holder}
  end
end
