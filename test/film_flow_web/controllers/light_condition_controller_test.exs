defmodule FilmFlowWeb.LightConditionControllerTest do
  use FilmFlowWeb.ConnCase

  import FilmFlow.SettingsFixtures
  import FilmFlow.AccountsFixtures

  setup do
    %{user: user_fixture()}
  end

  @create_attrs %{name: "some name", description: "some description", url_icon: "some url_icon"}
  @update_attrs %{
    name: "some updated name",
    description: "some updated description",
    url_icon: "some updated url_icon"
  }
  @invalid_attrs %{name: nil, description: nil, url_icon: nil}

  describe "index" do
    test "lists all light_conditions", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/light_conditions")
      assert html_response(conn, 200) =~ "Listing Light conditions"
    end
  end

  describe "new light_condition" do
    test "renders form", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/light_conditions/new")
      assert html_response(conn, 200) =~ "New Light condition"
    end
  end

  describe "create light_condition" do
    test "redirects to show when data is valid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/light_conditions", light_condition: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/light_conditions/#{id}"

      conn = get(conn, ~p"/light_conditions/#{id}")
      assert html_response(conn, 200) =~ "Light condition #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/light_conditions", light_condition: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Light condition"
    end
  end

  describe "edit light_condition" do
    setup [:create_light_condition]

    test "renders form for editing chosen light_condition", %{
      conn: conn,
      light_condition: light_condition,
      user: user
    } do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/light_conditions/#{light_condition}/edit")
      assert html_response(conn, 200) =~ "Edit Light condition"
    end
  end

  describe "update light_condition" do
    setup [:create_light_condition]

    test "redirects when data is valid", %{
      conn: conn,
      light_condition: light_condition,
      user: user
    } do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/light_conditions/#{light_condition}", light_condition: @update_attrs)
      assert redirected_to(conn) == ~p"/light_conditions/#{light_condition}"

      conn = get(conn, ~p"/light_conditions/#{light_condition}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{
      conn: conn,
      light_condition: light_condition,
      user: user
    } do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/light_conditions/#{light_condition}", light_condition: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Light condition"
    end
  end

  describe "delete light_condition" do
    setup [:create_light_condition]

    test "deletes chosen light_condition", %{
      conn: conn,
      light_condition: light_condition,
      user: user
    } do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = delete(conn, ~p"/light_conditions/#{light_condition}")
      assert redirected_to(conn) == ~p"/light_conditions"

      assert_error_sent 404, fn ->
        get(conn, ~p"/light_conditions/#{light_condition}")
      end
    end
  end

  defp create_light_condition(_) do
    light_condition = light_condition_fixture()
    %{light_condition: light_condition}
  end
end
