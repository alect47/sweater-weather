class AntipodeFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def lat
    antipode_service[:data][:attributes][:lat]
  end

  def long
    antipode_service[:data][:attributes][:long]
  end

  def antipode_city
    location = LocationService.new.get_address(lat, long)[:plus_code][:compound_code]

    location_object = LocationFacade.new(location).location_info
  end

  def antipode_city_name
    location = LocationService.new.get_address(lat, long)[:plus_code][:compound_code]
  end

  def antipode_city_forecast
    ForecastFacade.new(antipode_city).forecast
  end

  def antipode
    Antipode.new(antipode_city_forecast, antipode_city_name, @location)
  end

private
  def antipode_service
    AntipodeService.new.get_antipode(@location.latitude, @location.longitude)
  end
end
