class LocationService

  def get_geocode(address)
    json_response = conn.get('geocode/json?', {address: address})
    location_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  def get_address(lat, lng)
    json_response = conn.get('geocode/json?', {latlng: "#{lat},#{lng}"})
    location_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(
      url: 'https://maps.googleapis.com/maps/api/',
      params: {'key' => ENV['GOOGLE_API_KEY']}
    )
  end
end
