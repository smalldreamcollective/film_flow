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
      live "/exposure-guide", ExposureGuideLive.Index, :index

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

      get "/film", FilmController, :index
      get "/film/:id/edit", FilmController, :edit
      get "/film/new", FilmController, :new
      get "/film/:id", FilmController, :show
      post "/film", FilmController, :create
      patch "/film/:id", FilmController, :update
      put "/film/:id", FilmController, :update
      delete "/film/:id", FilmController, :delete

      get "/format", FormatController, :index
      get "/format/:id/edit", FormatController, :edit
      get "/format/new", FormatController, :new
      get "/format/:id", FormatController, :show
      post "/format", FormatController, :create
      patch "/format/:id", FormatController, :update
      put "/format/:id", FormatController, :update
      delete "/format/:id", FormatController, :delete

      get "/iso", ISOController, :index
      get "/iso/:id/edit", ISOController, :edit
      get "/iso/new", ISOController, :new
      get "/iso/:id", ISOController, :show
      post "/iso", ISOController, :create
      patch "/iso/:id", ISOController, :update
      put "/iso/:id", ISOController, :update
      delete "/iso/:id", ISOController, :delete

      get "/film_type", FilmTypeController, :index
      get "/film_type/:id/edit", FilmTypeController, :edit
      get "/film_type/new", FilmTypeController, :new
      get "/film_type/:id", FilmTypeController, :show
      post "/film_type", FilmTypeController, :create
      patch "/film_type/:id", FilmTypeController, :update
      put "/film_type/:id", FilmTypeController, :update
      delete "/film_type/:id", FilmTypeController, :delete

      get "/shutter_speed", ShutterSpeedController, :index
      get "/shutter_speed/:id/edit", ShutterSpeedController, :edit
      get "/shutter_speed/new", ShutterSpeedController, :new
      get "/shutter_speed/:id", ShutterSpeedController, :show
      post "/shutter_speed", ShutterSpeedController, :create
      patch "/shutter_speed/:id", ShutterSpeedController, :update
      put "/shutter_speed/:id", ShutterSpeedController, :update
      delete "/shutter_speed/:id", ShutterSpeedController, :delete

      get "/aperture", ApertureController, :index
      get "/aperture/:id/edit", ApertureController, :edit
      get "/aperture/new", ApertureController, :new
      get "/aperture/:id", ApertureController, :show
      post "/aperture", ApertureController, :create
      patch "/aperture/:id", ApertureController, :update
      put "/aperture/:id", ApertureController, :update
      delete "/aperture/:id", ApertureController, :delete

      get "/tripods", TripodController, :index
      get "/tripods/:id/edit", TripodController, :edit
      get "/tripods/new", TripodController, :new
      get "/tripods/:id", TripodController, :show
      post "/tripods", TripodController, :create
      patch "/tripods/:id", TripodController, :update
      put "/tripods/:id", TripodController, :update
      delete "/tripods/:id", TripodController, :delete

      get "/zones", ZoneController, :index
      get "/zones/:id/edit", ZoneController, :edit
      get "/zones/new", ZoneController, :new
      get "/zones/:id", ZoneController, :show
      post "/zones", ZoneController, :create
      patch "/zones/:id", ZoneController, :update
      put "/zones/:id", ZoneController, :update
      delete "/zones/:id", ZoneController, :delete

      get "/photographers", PhotographerController, :index
      get "/photographers/:id/edit", PhotographerController, :edit
      get "/photographers/new", PhotographerController, :new
      get "/photographers/:id", PhotographerController, :show
      post "/photographers", PhotographerController, :create
      patch "/photographers/:id", PhotographerController, :update
      put "/photographers/:id", PhotographerController, :update
      delete "/photographers/:id", PhotographerController, :delete

      get "/locations", LocationController, :index
      get "/locations/:id/edit", LocationController, :edit
      get "/locations/new", LocationController, :new
      get "/locations/:id", LocationController, :show
      post "/locations", LocationController, :create
      patch "/locations/:id", LocationController, :update
      put "/locations/:id", LocationController, :update
      delete "/locations/:id", LocationController, :delete

      get "/exposure_records", ExposureRecordController, :index
      get "/exposure_records/:id/edit", ExposureRecordController, :edit
      get "/exposure_records/new", ExposureRecordController, :new
      get "/exposure_records/:id", ExposureRecordController, :show
      post "/exposure_records", ExposureRecordController, :create
      patch "/exposure_records/:id", ExposureRecordController, :update
      put "/exposure_records/:id", ExposureRecordController, :update
      delete "/exposure_records/:id", ExposureRecordController, :delete

      get "/exposures", ExposureController, :index
      get "/exposures/:id/edit", ExposureController, :edit
      get "/exposures/new", ExposureController, :new
      get "/exposures/:id", ExposureController, :show
      post "/exposures", ExposureController, :create
      patch "/exposures/:id", ExposureController, :update
      put "/exposures/:id", ExposureController, :update
      delete "/exposures/:id", ExposureController, :delete

      get "/filters", FilterController, :index
      get "/filters/:id/edit", FilterController, :edit
      get "/filters/new", FilterController, :new
      get "/filters/:id", FilterController, :show
      post "/filters", FilterController, :create
      patch "/filters/:id", FilterController, :update
      put "/filters/:id", FilterController, :update
      delete "/filters/:id", FilterController, :delete

      get "/holders", HolderController, :index
      get "/holders/:id/edit", HolderController, :edit
      get "/holders/new", HolderController, :new
      get "/holders/:id", HolderController, :show
      post "/holders", HolderController, :create
      patch "/holders/:id", HolderController, :update
      put "/holders/:id", HolderController, :update
      delete "/holders/:id", HolderController, :delete

      get "/film_backs", FilmBackController, :index
      get "/film_backs/:id/edit", FilmBackController, :edit
      get "/film_backs/new", FilmBackController, :new
      get "/film_backs/:id", FilmBackController, :show
      post "/film_backs", FilmBackController, :create
      patch "/film_backs/:id", FilmBackController, :update
      put "/film_backs/:id", FilmBackController, :update
      delete "/film_backs/:id", FilmBackController, :delete

      get "/light_conditions", LightConditionController, :index
      get "/light_conditions/:id/edit", LightConditionController, :edit
      get "/light_conditions/new", LightConditionController, :new
      get "/light_conditions/:id", LightConditionController, :show
      post "/light_conditions", LightConditionController, :create
      patch "/light_conditions/:id", LightConditionController, :update
      put "/light_conditions/:id", LightConditionController, :update
      delete "/light_conditions/:id", LightConditionController, :delete

      get "/film_rolls", FilmRollController, :index
      get "/film_rolls/:id/edit", FilmRollController, :edit
      get "/film_rolls/new", FilmRollController, :new
      get "/film_rolls/:id", FilmRollController, :show
      post "/film_rolls", FilmRollController, :create
      patch "/film_rolls/:id", FilmRollController, :update
      put "/film_rolls/:id", FilmRollController, :update
      delete "/film_rolls/:id", FilmRollController, :delete
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
