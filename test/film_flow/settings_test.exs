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
end
