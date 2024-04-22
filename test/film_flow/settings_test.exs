defmodule FilmFlow.SettingsTest do
  use FilmFlow.DataCase

  alias FilmFlow.Settings

  describe "cameras" do
    alias FilmFlow.Settings.Camera

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{name: nil, brand: nil, model: nil}

    test "list_cameras/0 returns all cameras" do
      camera = camera_fixture()
      assert Settings.list_cameras() == [camera]
    end

    test "get_camera!/1 returns the camera with given id" do
      camera = camera_fixture()
      assert Settings.get_camera!(camera.id) == camera
    end

    test "create_camera/1 with valid data creates a camera" do
      valid_attrs = %{name: "some name", brand: "some brand", model: "some model"}

      assert {:ok, %Camera{} = camera} = Settings.create_camera(valid_attrs)
      assert camera.name == "some name"
      assert camera.brand == "some brand"
      assert camera.model == "some model"
    end

    test "create_camera/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_camera(@invalid_attrs)
    end

    test "update_camera/2 with valid data updates the camera" do
      camera = camera_fixture()
      update_attrs = %{name: "some updated name", brand: "some updated brand", model: "some updated model"}

      assert {:ok, %Camera{} = camera} = Settings.update_camera(camera, update_attrs)
      assert camera.name == "some updated name"
      assert camera.brand == "some updated brand"
      assert camera.model == "some updated model"
    end

    test "update_camera/2 with invalid data returns error changeset" do
      camera = camera_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_camera(camera, @invalid_attrs)
      assert camera == Settings.get_camera!(camera.id)
    end

    test "delete_camera/1 deletes the camera" do
      camera = camera_fixture()
      assert {:ok, %Camera{}} = Settings.delete_camera(camera)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_camera!(camera.id) end
    end

    test "change_camera/1 returns a camera changeset" do
      camera = camera_fixture()
      assert %Ecto.Changeset{} = Settings.change_camera(camera)
    end
  end

  describe "manufacturers" do
    alias FilmFlow.Settings.Manufacturer

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{name: nil, url: nil}

    test "list_manufacturers/0 returns all manufacturers" do
      manufacturer = manufacturer_fixture()
      assert Settings.list_manufacturers() == [manufacturer]
    end

    test "get_manufacturer!/1 returns the manufacturer with given id" do
      manufacturer = manufacturer_fixture()
      assert Settings.get_manufacturer!(manufacturer.id) == manufacturer
    end

    test "create_manufacturer/1 with valid data creates a manufacturer" do
      valid_attrs = %{name: "some name", url: "some url"}

      assert {:ok, %Manufacturer{} = manufacturer} = Settings.create_manufacturer(valid_attrs)
      assert manufacturer.name == "some name"
      assert manufacturer.url == "some url"
    end

    test "create_manufacturer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_manufacturer(@invalid_attrs)
    end

    test "update_manufacturer/2 with valid data updates the manufacturer" do
      manufacturer = manufacturer_fixture()
      update_attrs = %{name: "some updated name", url: "some updated url"}

      assert {:ok, %Manufacturer{} = manufacturer} = Settings.update_manufacturer(manufacturer, update_attrs)
      assert manufacturer.name == "some updated name"
      assert manufacturer.url == "some updated url"
    end

    test "update_manufacturer/2 with invalid data returns error changeset" do
      manufacturer = manufacturer_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_manufacturer(manufacturer, @invalid_attrs)
      assert manufacturer == Settings.get_manufacturer!(manufacturer.id)
    end

    test "delete_manufacturer/1 deletes the manufacturer" do
      manufacturer = manufacturer_fixture()
      assert {:ok, %Manufacturer{}} = Settings.delete_manufacturer(manufacturer)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_manufacturer!(manufacturer.id) end
    end

    test "change_manufacturer/1 returns a manufacturer changeset" do
      manufacturer = manufacturer_fixture()
      assert %Ecto.Changeset{} = Settings.change_manufacturer(manufacturer)
    end
  end

  describe "lenses" do
    alias FilmFlow.Settings.Lens

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{description: nil, model: nil, years: nil, url_manual: nil, url_additional_info: nil}

    test "list_lenses/0 returns all lenses" do
      lens = lens_fixture()
      assert Settings.list_lenses() == [lens]
    end

    test "get_lens!/1 returns the lens with given id" do
      lens = lens_fixture()
      assert Settings.get_lens!(lens.id) == lens
    end

    test "create_lens/1 with valid data creates a lens" do
      valid_attrs = %{description: "some description", model: "some model", years: "some years", url_manual: "some url_manual", url_additional_info: "some url_additional_info"}

      assert {:ok, %Lens{} = lens} = Settings.create_lens(valid_attrs)
      assert lens.description == "some description"
      assert lens.model == "some model"
      assert lens.years == "some years"
      assert lens.url_manual == "some url_manual"
      assert lens.url_additional_info == "some url_additional_info"
    end

    test "create_lens/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_lens(@invalid_attrs)
    end

    test "update_lens/2 with valid data updates the lens" do
      lens = lens_fixture()
      update_attrs = %{description: "some updated description", model: "some updated model", years: "some updated years", url_manual: "some updated url_manual", url_additional_info: "some updated url_additional_info"}

      assert {:ok, %Lens{} = lens} = Settings.update_lens(lens, update_attrs)
      assert lens.description == "some updated description"
      assert lens.model == "some updated model"
      assert lens.years == "some updated years"
      assert lens.url_manual == "some updated url_manual"
      assert lens.url_additional_info == "some updated url_additional_info"
    end

    test "update_lens/2 with invalid data returns error changeset" do
      lens = lens_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_lens(lens, @invalid_attrs)
      assert lens == Settings.get_lens!(lens.id)
    end

    test "delete_lens/1 deletes the lens" do
      lens = lens_fixture()
      assert {:ok, %Lens{}} = Settings.delete_lens(lens)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_lens!(lens.id) end
    end

    test "change_lens/1 returns a lens changeset" do
      lens = lens_fixture()
      assert %Ecto.Changeset{} = Settings.change_lens(lens)
    end
  end

  describe "format" do
    alias FilmFlow.Settings.Format

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{name: nil, description: nil}

    test "list_format/0 returns all format" do
      format = format_fixture()
      assert Settings.list_format() == [format]
    end

    test "get_format!/1 returns the format with given id" do
      format = format_fixture()
      assert Settings.get_format!(format.id) == format
    end

    test "create_format/1 with valid data creates a format" do
      valid_attrs = %{name: "some name", description: "some description"}

      assert {:ok, %Format{} = format} = Settings.create_format(valid_attrs)
      assert format.name == "some name"
      assert format.description == "some description"
    end

    test "create_format/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_format(@invalid_attrs)
    end

    test "update_format/2 with valid data updates the format" do
      format = format_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description"}

      assert {:ok, %Format{} = format} = Settings.update_format(format, update_attrs)
      assert format.name == "some updated name"
      assert format.description == "some updated description"
    end

    test "update_format/2 with invalid data returns error changeset" do
      format = format_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_format(format, @invalid_attrs)
      assert format == Settings.get_format!(format.id)
    end

    test "delete_format/1 deletes the format" do
      format = format_fixture()
      assert {:ok, %Format{}} = Settings.delete_format(format)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_format!(format.id) end
    end

    test "change_format/1 returns a format changeset" do
      format = format_fixture()
      assert %Ecto.Changeset{} = Settings.change_format(format)
    end
  end

  describe "iso" do
    alias FilmFlow.Settings.ISO

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{value: nil, description: nil}

    test "list_iso/0 returns all iso" do
      iso = iso_fixture()
      assert Settings.list_iso() == [iso]
    end

    test "get_iso!/1 returns the iso with given id" do
      iso = iso_fixture()
      assert Settings.get_iso!(iso.id) == iso
    end

    test "create_iso/1 with valid data creates a iso" do
      valid_attrs = %{value: "some value", description: "some description"}

      assert {:ok, %ISO{} = iso} = Settings.create_iso(valid_attrs)
      assert iso.value == "some value"
      assert iso.description == "some description"
    end

    test "create_iso/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_iso(@invalid_attrs)
    end

    test "update_iso/2 with valid data updates the iso" do
      iso = iso_fixture()
      update_attrs = %{value: "some updated value", description: "some updated description"}

      assert {:ok, %ISO{} = iso} = Settings.update_iso(iso, update_attrs)
      assert iso.value == "some updated value"
      assert iso.description == "some updated description"
    end

    test "update_iso/2 with invalid data returns error changeset" do
      iso = iso_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_iso(iso, @invalid_attrs)
      assert iso == Settings.get_iso!(iso.id)
    end

    test "delete_iso/1 deletes the iso" do
      iso = iso_fixture()
      assert {:ok, %ISO{}} = Settings.delete_iso(iso)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_iso!(iso.id) end
    end

    test "change_iso/1 returns a iso changeset" do
      iso = iso_fixture()
      assert %Ecto.Changeset{} = Settings.change_iso(iso)
    end
  end

  describe "film_type" do
    alias FilmFlow.Settings.FilmType

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{name: nil, description: nil}

    test "list_film_type/0 returns all film_type" do
      film_type = film_type_fixture()
      assert Settings.list_film_type() == [film_type]
    end

    test "get_film_type!/1 returns the film_type with given id" do
      film_type = film_type_fixture()
      assert Settings.get_film_type!(film_type.id) == film_type
    end

    test "create_film_type/1 with valid data creates a film_type" do
      valid_attrs = %{name: "some name", description: "some description"}

      assert {:ok, %FilmType{} = film_type} = Settings.create_film_type(valid_attrs)
      assert film_type.name == "some name"
      assert film_type.description == "some description"
    end

    test "create_film_type/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_film_type(@invalid_attrs)
    end

    test "update_film_type/2 with valid data updates the film_type" do
      film_type = film_type_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description"}

      assert {:ok, %FilmType{} = film_type} = Settings.update_film_type(film_type, update_attrs)
      assert film_type.name == "some updated name"
      assert film_type.description == "some updated description"
    end

    test "update_film_type/2 with invalid data returns error changeset" do
      film_type = film_type_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_film_type(film_type, @invalid_attrs)
      assert film_type == Settings.get_film_type!(film_type.id)
    end

    test "delete_film_type/1 deletes the film_type" do
      film_type = film_type_fixture()
      assert {:ok, %FilmType{}} = Settings.delete_film_type(film_type)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_film_type!(film_type.id) end
    end

    test "change_film_type/1 returns a film_type changeset" do
      film_type = film_type_fixture()
      assert %Ecto.Changeset{} = Settings.change_film_type(film_type)
    end
  end

  describe "film" do
    alias FilmFlow.Settings.Film

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{name: nil, description: nil}

    test "list_film/0 returns all film" do
      film = film_fixture()
      assert Settings.list_film() == [film]
    end

    test "get_film!/1 returns the film with given id" do
      film = film_fixture()
      assert Settings.get_film!(film.id) == film
    end

    test "create_film/1 with valid data creates a film" do
      valid_attrs = %{name: "some name", description: "some description"}

      assert {:ok, %Film{} = film} = Settings.create_film(valid_attrs)
      assert film.name == "some name"
      assert film.description == "some description"
    end

    test "create_film/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_film(@invalid_attrs)
    end

    test "update_film/2 with valid data updates the film" do
      film = film_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description"}

      assert {:ok, %Film{} = film} = Settings.update_film(film, update_attrs)
      assert film.name == "some updated name"
      assert film.description == "some updated description"
    end

    test "update_film/2 with invalid data returns error changeset" do
      film = film_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_film(film, @invalid_attrs)
      assert film == Settings.get_film!(film.id)
    end

    test "delete_film/1 deletes the film" do
      film = film_fixture()
      assert {:ok, %Film{}} = Settings.delete_film(film)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_film!(film.id) end
    end

    test "change_film/1 returns a film changeset" do
      film = film_fixture()
      assert %Ecto.Changeset{} = Settings.change_film(film)
    end
  end

  describe "shutter_speed" do
    alias FilmFlow.Settings.ShutterSpeed

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{value: nil}

    test "list_shutter_speed/0 returns all shutter_speed" do
      shutter_speed = shutter_speed_fixture()
      assert Settings.list_shutter_speed() == [shutter_speed]
    end

    test "get_shutter_speed!/1 returns the shutter_speed with given id" do
      shutter_speed = shutter_speed_fixture()
      assert Settings.get_shutter_speed!(shutter_speed.id) == shutter_speed
    end

    test "create_shutter_speed/1 with valid data creates a shutter_speed" do
      valid_attrs = %{value: "some value"}

      assert {:ok, %ShutterSpeed{} = shutter_speed} = Settings.create_shutter_speed(valid_attrs)
      assert shutter_speed.value == "some value"
    end

    test "create_shutter_speed/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_shutter_speed(@invalid_attrs)
    end

    test "update_shutter_speed/2 with valid data updates the shutter_speed" do
      shutter_speed = shutter_speed_fixture()
      update_attrs = %{value: "some updated value"}

      assert {:ok, %ShutterSpeed{} = shutter_speed} = Settings.update_shutter_speed(shutter_speed, update_attrs)
      assert shutter_speed.value == "some updated value"
    end

    test "update_shutter_speed/2 with invalid data returns error changeset" do
      shutter_speed = shutter_speed_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_shutter_speed(shutter_speed, @invalid_attrs)
      assert shutter_speed == Settings.get_shutter_speed!(shutter_speed.id)
    end

    test "delete_shutter_speed/1 deletes the shutter_speed" do
      shutter_speed = shutter_speed_fixture()
      assert {:ok, %ShutterSpeed{}} = Settings.delete_shutter_speed(shutter_speed)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_shutter_speed!(shutter_speed.id) end
    end

    test "change_shutter_speed/1 returns a shutter_speed changeset" do
      shutter_speed = shutter_speed_fixture()
      assert %Ecto.Changeset{} = Settings.change_shutter_speed(shutter_speed)
    end
  end

  describe "aperture" do
    alias FilmFlow.Settings.Aperture

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{value: nil}

    test "list_aperture/0 returns all aperture" do
      aperture = aperture_fixture()
      assert Settings.list_aperture() == [aperture]
    end

    test "get_aperture!/1 returns the aperture with given id" do
      aperture = aperture_fixture()
      assert Settings.get_aperture!(aperture.id) == aperture
    end

    test "create_aperture/1 with valid data creates a aperture" do
      valid_attrs = %{value: "some value"}

      assert {:ok, %Aperture{} = aperture} = Settings.create_aperture(valid_attrs)
      assert aperture.value == "some value"
    end

    test "create_aperture/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_aperture(@invalid_attrs)
    end

    test "update_aperture/2 with valid data updates the aperture" do
      aperture = aperture_fixture()
      update_attrs = %{value: "some updated value"}

      assert {:ok, %Aperture{} = aperture} = Settings.update_aperture(aperture, update_attrs)
      assert aperture.value == "some updated value"
    end

    test "update_aperture/2 with invalid data returns error changeset" do
      aperture = aperture_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_aperture(aperture, @invalid_attrs)
      assert aperture == Settings.get_aperture!(aperture.id)
    end

    test "delete_aperture/1 deletes the aperture" do
      aperture = aperture_fixture()
      assert {:ok, %Aperture{}} = Settings.delete_aperture(aperture)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_aperture!(aperture.id) end
    end

    test "change_aperture/1 returns a aperture changeset" do
      aperture = aperture_fixture()
      assert %Ecto.Changeset{} = Settings.change_aperture(aperture)
    end
  end

  describe "tripods" do
    alias FilmFlow.Settings.Tripod

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{description: nil, model: nil, years: nil, url_manual: nil, url_addtional_info: nil}

    test "list_tripods/0 returns all tripods" do
      tripod = tripod_fixture()
      assert Settings.list_tripods() == [tripod]
    end

    test "get_tripod!/1 returns the tripod with given id" do
      tripod = tripod_fixture()
      assert Settings.get_tripod!(tripod.id) == tripod
    end

    test "create_tripod/1 with valid data creates a tripod" do
      valid_attrs = %{description: "some description", model: "some model", years: "some years", url_manual: "some url_manual", url_addtional_info: "some url_addtional_info"}

      assert {:ok, %Tripod{} = tripod} = Settings.create_tripod(valid_attrs)
      assert tripod.description == "some description"
      assert tripod.model == "some model"
      assert tripod.years == "some years"
      assert tripod.url_manual == "some url_manual"
      assert tripod.url_addtional_info == "some url_addtional_info"
    end

    test "create_tripod/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_tripod(@invalid_attrs)
    end

    test "update_tripod/2 with valid data updates the tripod" do
      tripod = tripod_fixture()
      update_attrs = %{description: "some updated description", model: "some updated model", years: "some updated years", url_manual: "some updated url_manual", url_addtional_info: "some updated url_addtional_info"}

      assert {:ok, %Tripod{} = tripod} = Settings.update_tripod(tripod, update_attrs)
      assert tripod.description == "some updated description"
      assert tripod.model == "some updated model"
      assert tripod.years == "some updated years"
      assert tripod.url_manual == "some updated url_manual"
      assert tripod.url_addtional_info == "some updated url_addtional_info"
    end

    test "update_tripod/2 with invalid data returns error changeset" do
      tripod = tripod_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_tripod(tripod, @invalid_attrs)
      assert tripod == Settings.get_tripod!(tripod.id)
    end

    test "delete_tripod/1 deletes the tripod" do
      tripod = tripod_fixture()
      assert {:ok, %Tripod{}} = Settings.delete_tripod(tripod)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_tripod!(tripod.id) end
    end

    test "change_tripod/1 returns a tripod changeset" do
      tripod = tripod_fixture()
      assert %Ecto.Changeset{} = Settings.change_tripod(tripod)
    end
  end

  describe "zones" do
    alias FilmFlow.Settings.Zone

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{name: nil, description: nil}

    test "list_zones/0 returns all zones" do
      zone = zone_fixture()
      assert Settings.list_zones() == [zone]
    end

    test "get_zone!/1 returns the zone with given id" do
      zone = zone_fixture()
      assert Settings.get_zone!(zone.id) == zone
    end

    test "create_zone/1 with valid data creates a zone" do
      valid_attrs = %{name: "some name", description: "some description"}

      assert {:ok, %Zone{} = zone} = Settings.create_zone(valid_attrs)
      assert zone.name == "some name"
      assert zone.description == "some description"
    end

    test "create_zone/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_zone(@invalid_attrs)
    end

    test "update_zone/2 with valid data updates the zone" do
      zone = zone_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description"}

      assert {:ok, %Zone{} = zone} = Settings.update_zone(zone, update_attrs)
      assert zone.name == "some updated name"
      assert zone.description == "some updated description"
    end

    test "update_zone/2 with invalid data returns error changeset" do
      zone = zone_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_zone(zone, @invalid_attrs)
      assert zone == Settings.get_zone!(zone.id)
    end

    test "delete_zone/1 deletes the zone" do
      zone = zone_fixture()
      assert {:ok, %Zone{}} = Settings.delete_zone(zone)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_zone!(zone.id) end
    end

    test "change_zone/1 returns a zone changeset" do
      zone = zone_fixture()
      assert %Ecto.Changeset{} = Settings.change_zone(zone)
    end
  end

  describe "photographers" do
    alias FilmFlow.Settings.Photographer

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{first_name: nil, middle_name: nil, last_name: nil}

    test "list_photographers/0 returns all photographers" do
      photographer = photographer_fixture()
      assert Settings.list_photographers() == [photographer]
    end

    test "get_photographer!/1 returns the photographer with given id" do
      photographer = photographer_fixture()
      assert Settings.get_photographer!(photographer.id) == photographer
    end

    test "create_photographer/1 with valid data creates a photographer" do
      valid_attrs = %{first_name: "some first_name", middle_name: "some middle_name", last_name: "some last_name"}

      assert {:ok, %Photographer{} = photographer} = Settings.create_photographer(valid_attrs)
      assert photographer.first_name == "some first_name"
      assert photographer.middle_name == "some middle_name"
      assert photographer.last_name == "some last_name"
    end

    test "create_photographer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_photographer(@invalid_attrs)
    end

    test "update_photographer/2 with valid data updates the photographer" do
      photographer = photographer_fixture()
      update_attrs = %{first_name: "some updated first_name", middle_name: "some updated middle_name", last_name: "some updated last_name"}

      assert {:ok, %Photographer{} = photographer} = Settings.update_photographer(photographer, update_attrs)
      assert photographer.first_name == "some updated first_name"
      assert photographer.middle_name == "some updated middle_name"
      assert photographer.last_name == "some updated last_name"
    end

    test "update_photographer/2 with invalid data returns error changeset" do
      photographer = photographer_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_photographer(photographer, @invalid_attrs)
      assert photographer == Settings.get_photographer!(photographer.id)
    end

    test "delete_photographer/1 deletes the photographer" do
      photographer = photographer_fixture()
      assert {:ok, %Photographer{}} = Settings.delete_photographer(photographer)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_photographer!(photographer.id) end
    end

    test "change_photographer/1 returns a photographer changeset" do
      photographer = photographer_fixture()
      assert %Ecto.Changeset{} = Settings.change_photographer(photographer)
    end
  end

  describe "locations" do
    alias FilmFlow.Settings.Location

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{name: nil}

    test "list_locations/0 returns all locations" do
      location = location_fixture()
      assert Settings.list_locations() == [location]
    end

    test "get_location!/1 returns the location with given id" do
      location = location_fixture()
      assert Settings.get_location!(location.id) == location
    end

    test "create_location/1 with valid data creates a location" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Location{} = location} = Settings.create_location(valid_attrs)
      assert location.name == "some name"
    end

    test "create_location/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_location(@invalid_attrs)
    end

    test "update_location/2 with valid data updates the location" do
      location = location_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Location{} = location} = Settings.update_location(location, update_attrs)
      assert location.name == "some updated name"
    end

    test "update_location/2 with invalid data returns error changeset" do
      location = location_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_location(location, @invalid_attrs)
      assert location == Settings.get_location!(location.id)
    end

    test "delete_location/1 deletes the location" do
      location = location_fixture()
      assert {:ok, %Location{}} = Settings.delete_location(location)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_location!(location.id) end
    end

    test "change_location/1 returns a location changeset" do
      location = location_fixture()
      assert %Ecto.Changeset{} = Settings.change_location(location)
    end
  end

  describe "exposure_records" do
    alias FilmFlow.Settings.ExposureRecord

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{reference_id: nil, project_name: nil, date_loaded: nil, date_exposed: nil, concept: nil}

    test "list_exposure_records/0 returns all exposure_records" do
      exposure_record = exposure_record_fixture()
      assert Settings.list_exposure_records() == [exposure_record]
    end

    test "get_exposure_record!/1 returns the exposure_record with given id" do
      exposure_record = exposure_record_fixture()
      assert Settings.get_exposure_record!(exposure_record.id) == exposure_record
    end

    test "create_exposure_record/1 with valid data creates a exposure_record" do
      valid_attrs = %{reference_id: "some reference_id", project_name: "some project_name", date_loaded: ~U[2024-04-21 21:57:00Z], date_exposed: ~U[2024-04-21 21:57:00Z], concept: "some concept"}

      assert {:ok, %ExposureRecord{} = exposure_record} = Settings.create_exposure_record(valid_attrs)
      assert exposure_record.reference_id == "some reference_id"
      assert exposure_record.project_name == "some project_name"
      assert exposure_record.date_loaded == ~U[2024-04-21 21:57:00Z]
      assert exposure_record.date_exposed == ~U[2024-04-21 21:57:00Z]
      assert exposure_record.concept == "some concept"
    end

    test "create_exposure_record/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_exposure_record(@invalid_attrs)
    end

    test "update_exposure_record/2 with valid data updates the exposure_record" do
      exposure_record = exposure_record_fixture()
      update_attrs = %{reference_id: "some updated reference_id", project_name: "some updated project_name", date_loaded: ~U[2024-04-22 21:57:00Z], date_exposed: ~U[2024-04-22 21:57:00Z], concept: "some updated concept"}

      assert {:ok, %ExposureRecord{} = exposure_record} = Settings.update_exposure_record(exposure_record, update_attrs)
      assert exposure_record.reference_id == "some updated reference_id"
      assert exposure_record.project_name == "some updated project_name"
      assert exposure_record.date_loaded == ~U[2024-04-22 21:57:00Z]
      assert exposure_record.date_exposed == ~U[2024-04-22 21:57:00Z]
      assert exposure_record.concept == "some updated concept"
    end

    test "update_exposure_record/2 with invalid data returns error changeset" do
      exposure_record = exposure_record_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_exposure_record(exposure_record, @invalid_attrs)
      assert exposure_record == Settings.get_exposure_record!(exposure_record.id)
    end

    test "delete_exposure_record/1 deletes the exposure_record" do
      exposure_record = exposure_record_fixture()
      assert {:ok, %ExposureRecord{}} = Settings.delete_exposure_record(exposure_record)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_exposure_record!(exposure_record.id) end
    end

    test "change_exposure_record/1 returns a exposure_record changeset" do
      exposure_record = exposure_record_fixture()
      assert %Ecto.Changeset{} = Settings.change_exposure_record(exposure_record)
    end
  end

  describe "filters" do
    alias FilmFlow.Settings.Filter

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{description: nil, model: nil, years: nil, url_manual: nil, url_additional_info: nil}

    test "list_filters/0 returns all filters" do
      filter = filter_fixture()
      assert Settings.list_filters() == [filter]
    end

    test "get_filter!/1 returns the filter with given id" do
      filter = filter_fixture()
      assert Settings.get_filter!(filter.id) == filter
    end

    test "create_filter/1 with valid data creates a filter" do
      valid_attrs = %{description: "some description", model: "some model", years: "some years", url_manual: "some url_manual", url_additional_info: "some url_additional_info"}

      assert {:ok, %Filter{} = filter} = Settings.create_filter(valid_attrs)
      assert filter.description == "some description"
      assert filter.model == "some model"
      assert filter.years == "some years"
      assert filter.url_manual == "some url_manual"
      assert filter.url_additional_info == "some url_additional_info"
    end

    test "create_filter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_filter(@invalid_attrs)
    end

    test "update_filter/2 with valid data updates the filter" do
      filter = filter_fixture()
      update_attrs = %{description: "some updated description", model: "some updated model", years: "some updated years", url_manual: "some updated url_manual", url_additional_info: "some updated url_additional_info"}

      assert {:ok, %Filter{} = filter} = Settings.update_filter(filter, update_attrs)
      assert filter.description == "some updated description"
      assert filter.model == "some updated model"
      assert filter.years == "some updated years"
      assert filter.url_manual == "some updated url_manual"
      assert filter.url_additional_info == "some updated url_additional_info"
    end

    test "update_filter/2 with invalid data returns error changeset" do
      filter = filter_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_filter(filter, @invalid_attrs)
      assert filter == Settings.get_filter!(filter.id)
    end

    test "delete_filter/1 deletes the filter" do
      filter = filter_fixture()
      assert {:ok, %Filter{}} = Settings.delete_filter(filter)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_filter!(filter.id) end
    end

    test "change_filter/1 returns a filter changeset" do
      filter = filter_fixture()
      assert %Ecto.Changeset{} = Settings.change_filter(filter)
    end
  end

  describe "holders" do
    alias FilmFlow.Settings.Holder

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{description: nil, model: nil, years: nil, url_manual: nil, url_additional_info: nil}

    test "list_holders/0 returns all holders" do
      holder = holder_fixture()
      assert Settings.list_holders() == [holder]
    end

    test "get_holder!/1 returns the holder with given id" do
      holder = holder_fixture()
      assert Settings.get_holder!(holder.id) == holder
    end

    test "create_holder/1 with valid data creates a holder" do
      valid_attrs = %{description: "some description", model: "some model", years: "some years", url_manual: "some url_manual", url_additional_info: "some url_additional_info"}

      assert {:ok, %Holder{} = holder} = Settings.create_holder(valid_attrs)
      assert holder.description == "some description"
      assert holder.model == "some model"
      assert holder.years == "some years"
      assert holder.url_manual == "some url_manual"
      assert holder.url_additional_info == "some url_additional_info"
    end

    test "create_holder/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_holder(@invalid_attrs)
    end

    test "update_holder/2 with valid data updates the holder" do
      holder = holder_fixture()
      update_attrs = %{description: "some updated description", model: "some updated model", years: "some updated years", url_manual: "some updated url_manual", url_additional_info: "some updated url_additional_info"}

      assert {:ok, %Holder{} = holder} = Settings.update_holder(holder, update_attrs)
      assert holder.description == "some updated description"
      assert holder.model == "some updated model"
      assert holder.years == "some updated years"
      assert holder.url_manual == "some updated url_manual"
      assert holder.url_additional_info == "some updated url_additional_info"
    end

    test "update_holder/2 with invalid data returns error changeset" do
      holder = holder_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_holder(holder, @invalid_attrs)
      assert holder == Settings.get_holder!(holder.id)
    end

    test "delete_holder/1 deletes the holder" do
      holder = holder_fixture()
      assert {:ok, %Holder{}} = Settings.delete_holder(holder)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_holder!(holder.id) end
    end

    test "change_holder/1 returns a holder changeset" do
      holder = holder_fixture()
      assert %Ecto.Changeset{} = Settings.change_holder(holder)
    end
  end

  describe "film_backs" do
    alias FilmFlow.Settings.FilmBack

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{description: nil, model: nil, years: nil, url_manual: nil, url_additional_info: nil}

    test "list_film_backs/0 returns all film_backs" do
      film_back = film_back_fixture()
      assert Settings.list_film_backs() == [film_back]
    end

    test "get_film_back!/1 returns the film_back with given id" do
      film_back = film_back_fixture()
      assert Settings.get_film_back!(film_back.id) == film_back
    end

    test "create_film_back/1 with valid data creates a film_back" do
      valid_attrs = %{description: "some description", model: "some model", years: "some years", url_manual: "some url_manual", url_additional_info: "some url_additional_info"}

      assert {:ok, %FilmBack{} = film_back} = Settings.create_film_back(valid_attrs)
      assert film_back.description == "some description"
      assert film_back.model == "some model"
      assert film_back.years == "some years"
      assert film_back.url_manual == "some url_manual"
      assert film_back.url_additional_info == "some url_additional_info"
    end

    test "create_film_back/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_film_back(@invalid_attrs)
    end

    test "update_film_back/2 with valid data updates the film_back" do
      film_back = film_back_fixture()
      update_attrs = %{description: "some updated description", model: "some updated model", years: "some updated years", url_manual: "some updated url_manual", url_additional_info: "some updated url_additional_info"}

      assert {:ok, %FilmBack{} = film_back} = Settings.update_film_back(film_back, update_attrs)
      assert film_back.description == "some updated description"
      assert film_back.model == "some updated model"
      assert film_back.years == "some updated years"
      assert film_back.url_manual == "some updated url_manual"
      assert film_back.url_additional_info == "some updated url_additional_info"
    end

    test "update_film_back/2 with invalid data returns error changeset" do
      film_back = film_back_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_film_back(film_back, @invalid_attrs)
      assert film_back == Settings.get_film_back!(film_back.id)
    end

    test "delete_film_back/1 deletes the film_back" do
      film_back = film_back_fixture()
      assert {:ok, %FilmBack{}} = Settings.delete_film_back(film_back)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_film_back!(film_back.id) end
    end

    test "change_film_back/1 returns a film_back changeset" do
      film_back = film_back_fixture()
      assert %Ecto.Changeset{} = Settings.change_film_back(film_back)
    end
  end

  describe "light_conditions" do
    alias FilmFlow.Settings.LightCondition

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{name: nil, description: nil, url_icon: nil}

    test "list_light_conditions/0 returns all light_conditions" do
      light_condition = light_condition_fixture()
      assert Settings.list_light_conditions() == [light_condition]
    end

    test "get_light_condition!/1 returns the light_condition with given id" do
      light_condition = light_condition_fixture()
      assert Settings.get_light_condition!(light_condition.id) == light_condition
    end

    test "create_light_condition/1 with valid data creates a light_condition" do
      valid_attrs = %{name: "some name", description: "some description", url_icon: "some url_icon"}

      assert {:ok, %LightCondition{} = light_condition} = Settings.create_light_condition(valid_attrs)
      assert light_condition.name == "some name"
      assert light_condition.description == "some description"
      assert light_condition.url_icon == "some url_icon"
    end

    test "create_light_condition/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_light_condition(@invalid_attrs)
    end

    test "update_light_condition/2 with valid data updates the light_condition" do
      light_condition = light_condition_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", url_icon: "some updated url_icon"}

      assert {:ok, %LightCondition{} = light_condition} = Settings.update_light_condition(light_condition, update_attrs)
      assert light_condition.name == "some updated name"
      assert light_condition.description == "some updated description"
      assert light_condition.url_icon == "some updated url_icon"
    end

    test "update_light_condition/2 with invalid data returns error changeset" do
      light_condition = light_condition_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_light_condition(light_condition, @invalid_attrs)
      assert light_condition == Settings.get_light_condition!(light_condition.id)
    end

    test "delete_light_condition/1 deletes the light_condition" do
      light_condition = light_condition_fixture()
      assert {:ok, %LightCondition{}} = Settings.delete_light_condition(light_condition)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_light_condition!(light_condition.id) end
    end

    test "change_light_condition/1 returns a light_condition changeset" do
      light_condition = light_condition_fixture()
      assert %Ecto.Changeset{} = Settings.change_light_condition(light_condition)
    end
  end

  describe "film_rolls" do
    alias FilmFlow.Settings.FilmRoll

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{name: nil, description: nil, reference_id: nil, frames: nil, expirate_date: nil}

    test "list_film_rolls/0 returns all film_rolls" do
      film_roll = film_roll_fixture()
      assert Settings.list_film_rolls() == [film_roll]
    end

    test "get_film_roll!/1 returns the film_roll with given id" do
      film_roll = film_roll_fixture()
      assert Settings.get_film_roll!(film_roll.id) == film_roll
    end

    test "create_film_roll/1 with valid data creates a film_roll" do
      valid_attrs = %{name: "some name", description: "some description", reference_id: "some reference_id", frames: 42, expirate_date: ~U[2024-04-21 22:45:00Z]}

      assert {:ok, %FilmRoll{} = film_roll} = Settings.create_film_roll(valid_attrs)
      assert film_roll.name == "some name"
      assert film_roll.description == "some description"
      assert film_roll.reference_id == "some reference_id"
      assert film_roll.frames == 42
      assert film_roll.expirate_date == ~U[2024-04-21 22:45:00Z]
    end

    test "create_film_roll/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_film_roll(@invalid_attrs)
    end

    test "update_film_roll/2 with valid data updates the film_roll" do
      film_roll = film_roll_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", reference_id: "some updated reference_id", frames: 43, expirate_date: ~U[2024-04-22 22:45:00Z]}

      assert {:ok, %FilmRoll{} = film_roll} = Settings.update_film_roll(film_roll, update_attrs)
      assert film_roll.name == "some updated name"
      assert film_roll.description == "some updated description"
      assert film_roll.reference_id == "some updated reference_id"
      assert film_roll.frames == 43
      assert film_roll.expirate_date == ~U[2024-04-22 22:45:00Z]
    end

    test "update_film_roll/2 with invalid data returns error changeset" do
      film_roll = film_roll_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_film_roll(film_roll, @invalid_attrs)
      assert film_roll == Settings.get_film_roll!(film_roll.id)
    end

    test "delete_film_roll/1 deletes the film_roll" do
      film_roll = film_roll_fixture()
      assert {:ok, %FilmRoll{}} = Settings.delete_film_roll(film_roll)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_film_roll!(film_roll.id) end
    end

    test "change_film_roll/1 returns a film_roll changeset" do
      film_roll = film_roll_fixture()
      assert %Ecto.Changeset{} = Settings.change_film_roll(film_roll)
    end
  end

  describe "exposures" do
    alias FilmFlow.Settings.Exposure

    import FilmFlow.SettingsFixtures

    @invalid_attrs %{frame: nil, subject: nil, date_exposed: nil, lighting_condition: nil, notes: nil}

    test "list_exposures/0 returns all exposures" do
      exposure = exposure_fixture()
      assert Settings.list_exposures() == [exposure]
    end

    test "get_exposure!/1 returns the exposure with given id" do
      exposure = exposure_fixture()
      assert Settings.get_exposure!(exposure.id) == exposure
    end

    test "create_exposure/1 with valid data creates a exposure" do
      valid_attrs = %{frame: 42, subject: "some subject", date_exposed: ~U[2024-04-21 23:00:00Z], lighting_condition: "some lighting_condition", notes: "some notes"}

      assert {:ok, %Exposure{} = exposure} = Settings.create_exposure(valid_attrs)
      assert exposure.frame == 42
      assert exposure.subject == "some subject"
      assert exposure.date_exposed == ~U[2024-04-21 23:00:00Z]
      assert exposure.lighting_condition == "some lighting_condition"
      assert exposure.notes == "some notes"
    end

    test "create_exposure/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Settings.create_exposure(@invalid_attrs)
    end

    test "update_exposure/2 with valid data updates the exposure" do
      exposure = exposure_fixture()
      update_attrs = %{frame: 43, subject: "some updated subject", date_exposed: ~U[2024-04-22 23:00:00Z], lighting_condition: "some updated lighting_condition", notes: "some updated notes"}

      assert {:ok, %Exposure{} = exposure} = Settings.update_exposure(exposure, update_attrs)
      assert exposure.frame == 43
      assert exposure.subject == "some updated subject"
      assert exposure.date_exposed == ~U[2024-04-22 23:00:00Z]
      assert exposure.lighting_condition == "some updated lighting_condition"
      assert exposure.notes == "some updated notes"
    end

    test "update_exposure/2 with invalid data returns error changeset" do
      exposure = exposure_fixture()
      assert {:error, %Ecto.Changeset{}} = Settings.update_exposure(exposure, @invalid_attrs)
      assert exposure == Settings.get_exposure!(exposure.id)
    end

    test "delete_exposure/1 deletes the exposure" do
      exposure = exposure_fixture()
      assert {:ok, %Exposure{}} = Settings.delete_exposure(exposure)
      assert_raise Ecto.NoResultsError, fn -> Settings.get_exposure!(exposure.id) end
    end

    test "change_exposure/1 returns a exposure changeset" do
      exposure = exposure_fixture()
      assert %Ecto.Changeset{} = Settings.change_exposure(exposure)
    end
  end
end
