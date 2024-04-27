defmodule FilmFlowWeb.LensControllerTest do
  use FilmFlowWeb.ConnCase, async: false

  import FilmFlow.SettingsFixtures
  import FilmFlow.AccountsFixtures

  setup do
    %{
      user: user_fixture()
    }
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
    test "lists all lenses", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/lenses")

      assert html_response(conn, 200) =~ "Listing Lenses"
    end
  end

  describe "new lens" do
    test "renders form", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/lenses/new")
      assert html_response(conn, 200) =~ "New Lens"
    end
  end

  describe "create lens" do
    # test "redirects to show when data is valid", %{
    #   conn: conn,
    #   user: user
    # } do
    #   conn =
    #     post(conn, ~p"/users/log_in", %{
    #       "user" => %{"email" => user.email, "password" => valid_user_password()}
    #     })

    #   conn = post(conn, ~p"/lenses", lens: @create_attrs)

    #   assert %{id: id} = redirected_params(conn)
    #   assert redirected_to(conn) == ~p"/lenses/#{id}"

    #   conn = get(conn, ~p"/lenses/#{id}")
    #   assert html_response(conn, 200) =~ "Lens #{id}"
    # end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = post(conn, ~p"/lenses", lens: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Lens"
    end
  end

  describe "edit lens" do
    setup [:create_lens]

    test "renders form for editing chosen lens", %{conn: conn, lens: lens, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = get(conn, ~p"/lenses/#{lens}/edit")
      assert html_response(conn, 200) =~ "Edit Lens"
    end
  end

  describe "update lens" do
    setup [:create_lens]

    # test "redirects when data is valid", %{conn: conn, lens: lens, user: user} do
    #   conn =
    #     post(conn, ~p"/users/log_in", %{
    #       "user" => %{"email" => user.email, "password" => valid_user_password()}
    #     })

    #   conn = put(conn, ~p"/lenses/#{lens}", lens: @update_attrs)
    #   assert redirected_to(conn) == ~p"/lenses/#{lens}"

    #   conn = get(conn, ~p"/lenses/#{lens}")
    #   assert html_response(conn, 200) =~ "some updated description"
    # end

    test "renders errors when data is invalid", %{conn: conn, lens: lens, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = put(conn, ~p"/lenses/#{lens}", lens: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Lens"
    end
  end

  describe "delete lens" do
    setup [:create_lens]

    test "deletes chosen lens", %{conn: conn, lens: lens, user: user} do
      conn =
        post(conn, ~p"/users/log_in", %{
          "user" => %{"email" => user.email, "password" => valid_user_password()}
        })

      conn = delete(conn, ~p"/lenses/#{lens}")
      assert redirected_to(conn) == ~p"/lenses"

      assert_error_sent 404, fn ->
        get(conn, ~p"/lenses/#{lens}")
      end
    end
  end

  defp create_lens(_) do
    lens = lens_fixture()
    %{lens: lens}
  end
end
