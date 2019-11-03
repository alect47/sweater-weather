class DarkSkyService

  def get_geocode(lat, lng)
    json_response = conn.get("#{lat},#{lng}")
    weather_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(
      url: "https://api.darksky.net/forecast/#{ENV['DARK_SKY_KEY']}"
    )
  end
end
