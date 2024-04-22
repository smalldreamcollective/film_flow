defmodule FilmFlowWeb.Router do
  use FilmFlowWeb, :router

  import FilmFlowWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {FilmFlowWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FilmFlowWeb do
    pipe_through :browser

    get "/", PageController, :home
    # GET     /users           HelloWeb.UserController :index
    # GET     /users/:id/edit  HelloWeb.UserController :edit
    # GET     /users/new       HelloWeb.UserController :new
    # GET     /users/:id       HelloWeb.UserController :show
    # POST    /users           HelloWeb.UserController :create
    # PATCH   /users/:id       HelloWeb.UserController :update
    # PUT     /users/:id       HelloWeb.UserController :update
    # DELETE  /users/:id       HelloWeb.UserController :delete

  end

  # Other scopes may use custom stacks.
  # scope "/api", FilmFlowWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:film_flow, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: FilmFlowWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", FilmFlowWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    live_session :redirect_if_user_is_authenticated,
      on_mount: [{FilmFlowWeb.UserAuth, :redirect_if_user_is_authenticated}] do
      live "/users/register", UserRegistrationLive, :new
      live "/users/log_in", UserLoginLive, :new
      live "/users/reset_password", UserForgotPasswordLive, :new
      live "/users/reset_password/:token", UserResetPasswordLive, :edit
    end

    post "/users/log_in", UserSessionController, :create
  end

  scope "/", FilmFlowWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [{FilmFlowWeb.UserAuth, :ensure_authenticated}] do
      live "/users/settings", UserSettingsLive, :edit
      live "/users/settings/confirm_email/:token", UserSettingsLive, :confirm_email

      get "/cameras", CameraController, :index
      get "/cameras/:id/edit", CameraController, :edit
      get "/cameras/new", CameraController, :new
      get "/cameras/:id", CameraController, :show
      post "/cameras", CameraController, :create
      patch "/cameras/:id", CameraController, :update
      put "/cameras/:id", CameraController, :update
      delete "/cameras/:id", CameraController, :delete

      get "/manufacturers", ManufacturerController, :index
      get "/manufacturers/:id/edit", ManufacturerController, :edit
      get "/manufacturers/new", ManufacturerController, :new
      get "/manufacturers/:id", ManufacturerController, :show
      post "/manufacturers", ManufacturerController, :create
      patch "/manufacturers/:id", ManufacturerController, :update
      put "/manufacturers/:id", ManufacturerController, :update
      delete "/manufacturers/:id", ManufacturerController, :delete

      get "/lenses", LensController, :index
      get "/lenses/:id/edit", LensController, :edit
      get "/lenses/new", LensController, :new
      get "/lenses/:id", LensController, :show
      post "/lenses", LensController, :create
      patch "/lenses/:id", LensController, :update
      put "/lenses/:id", LensController, :update
      delete "/lenses/:id", LensController, :delete

      get "/format", FormatController, :index
      get "/format/:id/edit", FormatController, :edit
      get "/format/new", FormatController, :new
      get "/format/:id", FormatController, :show
      post "/format", FormatController, :create
      patch "/format/:id", FormatController, :update
      put "/format/:id", FormatController, :update
      delete "/format/:id", FormatController, :delete
    end
  end

  scope "/", FilmFlowWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete

    live_session :current_user,
      on_mount: [{FilmFlowWeb.UserAuth, :mount_current_user}] do
      live "/users/confirm/:token", UserConfirmationLive, :edit
      live "/users/confirm", UserConfirmationInstructionsLive, :new
    end
  end
end
