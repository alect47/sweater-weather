class LocationService

  def get_geocode(address)
    binding.pry
    json_response = conn.get('geocode/json?', {address: address})
    location_data = JSON.parse(json_response.body, symbolize_names: true)
  end

  def conn
    Faraday.new(
      url: 'https://maps.googleapis.com/maps/api/',
      params: {'key' => ENV['GOOGLE_API_KEY']}
    )
  end
end
