defmodule FilmFlowWeb.ExposureGuideLive.Index do
  use FilmFlowWeb, :live_view

  @moduledoc """
  LiveView for the exposure guide, including exposure values, zone system, and shooting conditions.
  """

  @exposure_values [
    %{ev: -6, condition: "Rural area lit by starlight."},
    %{ev: -5, condition: "Night, rural lit by crescent moon."},
    %{ev: -4, condition: "Night, rural, lit by half moon."},
    %{ev: -3, condition: "Night, rural, lit by full moon."},
    %{ev: -2, condition: "Night, snow or sand under full moon."},
    %{ev: -1, condition: "Night, away from city lights."},
    %{ev: 0, condition: "Dim interior, artificial light."},
    %{ev: 1, condition: "Distant view of city skyline at night."},
    %{ev: 2, condition: "Lit city skyline at night"},
    %{ev: 3, condition: "Candlelight. Lit buildings at distance."},
    %{ev: 4, condition: "Holiday lighting. Candlelit close-ups."},
    %{ev: 5, condition: "Floodlit buildings and monuments."},
    %{ev: 6, condition: "Home interiors. Auditoriums."},
    %{ev: 7, condition: "Lit streets and shops at night. Fairs."},
    %{ev: 8, condition: "Sports/stage events. Offices. Campfires."},
    %{ev: 9, condition: "Pre-dusk or dawn. Neon. Spotlights."},
    %{ev: 10, condition: "Landscape at dusk or dawn."},
    %{ev: 11, condition: "Open shade. Sunsets."},
    %{ev: 12, condition: "Heavy overcast."},
    %{ev: 13, condition: "Overcast. No shadows."},
    %{ev: 14, condition: "Hazy sunlight. Slight overcast."},
    %{ev: 15, condition: "Bright or hazy sun (Sunny 16 rule)."},
    %{ev: 16, condition: "Bright daylight on sand or snow."},
    %{ev: "17-21", condition: "Unnaturally bright. Man-made lighting."},
    %{ev: "22-23", condition: "Extremely bright. Rare, unnatural."}
  ]

  @zone_system [
    %{zone: "0", description: "Pure black."},
    %{zone: "I", description: "Near black, slight tonality but no texture."},
    %{zone: "II", description: "Dark black, slight detail/texture in darkest areas."},
    %{zone: "III", description: "Very dark materials and low values with adequate textures"},
    %{zone: "IV", description: "Dark foliage, dark stone, or landscape shadows."},
    %{zone: "V", description: "Middle gray, clear north sky, dark skin, weathered wood"},
    %{zone: "VI", description: "Caucasian skin, light stone, snow shadows in sunlit landscapes."},
    %{zone: "VII", description: "Light skin tone, shadows in snow with acute side lighting."},
    %{zone: "VIII", description: "Lightest tone with texture, textured snow."},
    %{zone: "IX", description: "Slight tone without texture, glaring snow."},
    %{zone: "X", description: "Pure white, light sources and specular reflections."}
  ]

  @symbol_key [
    %{symbol: "☀️", meaning: "Sunny"},
    %{symbol: "⛅", meaning: "Partly Cloudy"},
    %{symbol: "☁️", meaning: "Cloudy"},
    %{symbol: "🌙", meaning: "Night"},
    %{symbol: "🌅", meaning: "Sunrise/Sunset"},
    %{symbol: "🌧️", meaning: "Rain"},
    %{symbol: "❄️", meaning: "Snow"},
    %{symbol: "🌫️", meaning: "Fog"},
    %{symbol: "🌲", meaning: "Forest"},
    %{symbol: "🏙️", meaning: "Urban"},
    %{symbol: "🏖️", meaning: "Beach"},
    %{symbol: "🏔️", meaning: "Mountain"},
    %{symbol: "🌊", meaning: "Water"},
    %{symbol: "🏛️", meaning: "Architecture"},
    %{symbol: "🎭", meaning: "Portrait"}
  ]

  @compile {:inline, exposure_values: 0}
  @compile {:inline, zone_system: 0}
  @compile {:inline, symbol_key: 0}

  def exposure_values, do: @exposure_values
  def zone_system, do: @zone_system
  def symbol_key, do: @symbol_key

  def mount(_params, _session, socket) do
    films = FilmFlow.Settings.list_film()

    socket =
      assign(socket,
        exposure_values: exposure_values(),
        zone_system: zone_system(),
        symbol_key: symbol_key(),
        iso: 100,
        selected_ev: 15,
        selected_zone: "V",
        used_symbols: [],
        aperture: "f/16",
        shutter_speed: "1/100",
        notes: "",
        films: films
      )

    {:ok, socket}
  end

  def handle_event("select_ev", %{"ev" => ev_string}, socket) do
    ev =
      case Integer.parse(ev_string) do
        {ev, _} -> ev
        :error -> ev_string
      end

    {aperture, shutter_speed} = calculate_exposure(ev, socket.assigns.iso)

    {:noreply, assign(socket, selected_ev: ev, aperture: aperture, shutter_speed: shutter_speed)}
  end

  def handle_event("select_zone", %{"zone" => zone}, socket) do
    {:noreply, assign(socket, selected_zone: zone)}
  end

  def handle_event("update_iso", %{"value" => iso_string}, socket) do
    iso = String.to_integer(iso_string)
    {aperture, shutter_speed} = calculate_exposure(socket.assigns.selected_ev, iso)

    {:noreply, assign(socket, iso: iso, aperture: aperture, shutter_speed: shutter_speed)}
  end

  def handle_event("toggle_symbol", %{"symbol" => symbol}, socket) do
    used_symbols =
      if symbol in socket.assigns.used_symbols do
        List.delete(socket.assigns.used_symbols, symbol)
      else
        [symbol | socket.assigns.used_symbols]
      end

    {:noreply, assign(socket, used_symbols: used_symbols)}
  end

  def handle_event("update_notes", %{"value" => notes}, socket) do
    {:noreply, assign(socket, notes: notes)}
  end

  defp calculate_exposure(ev, iso) when is_integer(ev) do
    # For Sunny 16 rule (EV 15)
    if ev == 15 do
      {"f/16", "1/#{iso}"}
    else
      # Simple exposure calculation based on EV difference from Sunny 16
      ev_diff = ev - 15

      # Each EV change is 1 stop
      # Simplified calculation for demonstration
      if ev_diff > 0 do
        # Brighter than sunny 16
        {"f/#{16 * :math.pow(2, div(ev_diff, 2))}",
         "1/#{iso * :math.pow(2, ev_diff - div(ev_diff, 2))}"}
      else
        # Darker than sunny 16
        {"f/#{16 / :math.pow(2, div(-ev_diff, 2))}",
         "1/#{iso / :math.pow(2, -ev_diff - div(-ev_diff, 2))}"}
      end
      |> format_exposure_values()
    end
  end

  defp calculate_exposure(_ev, _iso) do
    # For non-integer EV ranges like "17-21"
    {"Varies", "Varies"}
  end

  defp format_exposure_values({aperture, shutter_speed}) when is_float(aperture) do
    aperture_str = "f/#{:io_lib.format("~.1f", [aperture]) |> to_string() |> String.trim()}"

    shutter_speed_str =
      cond do
        shutter_speed < 1 -> "1/#{round(1 / shutter_speed)}"
        true -> "#{:io_lib.format("~.1f", [shutter_speed]) |> to_string() |> String.trim()}"
      end

    {aperture_str, shutter_speed_str}
  end

  defp format_exposure_values(values), do: values
end
