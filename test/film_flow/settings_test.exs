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
end
