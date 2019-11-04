class AntipodeService

  def get_antipode(lat, lng)
    json_response = conn.get("antipodes?lat=#{lat}&long=#{lng}")
    weather_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(
      url: 'http://amypode.herokuapp.com/api/v1/',
      headers: {'api_key' => ENV['AMYPODE_KEY']}
    )
  end
end
