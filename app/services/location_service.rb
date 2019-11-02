class LocationService

  def get_geocode(address
    conn
  end

  def conn
    Faraday.new(
      url: 'https://maps.googleapis.com/maps/api/geocode/json?',
      params: {'key' => ENV['GOOGLE_API_KEY']}
    )
  end
end
