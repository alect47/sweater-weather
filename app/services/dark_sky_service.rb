class DarkSkyService

  def get_forecast(lat, lng, time = nil)
    if time
      json_response = conn.get("#{lat},#{lng},#{time}")
    else
      json_response = conn.get("#{lat},#{lng}")
    end
    weather_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(
      url: "https://api.darksky.net/forecast/#{ENV['DARK_SKY_KEY']}"
    )
  end
end
