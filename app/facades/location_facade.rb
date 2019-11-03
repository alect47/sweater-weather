class LocationFacade

  def initialize(location)
    @location = location
  end

  def location_info
    Location.new(location_service)
  end

private

  def location_service
    LocationService.new.get_geocode(@location)
  end
end
