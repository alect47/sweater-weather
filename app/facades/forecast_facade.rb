class ForecastFacade

  def initialize(location)
    @location = location
  end
  #
  # def location_info
  #   Location.new(location_service)
  # end

  def forecast
    Forecast.new(forecast_service, @location)
  end

# private
#
#   def location_service
#     LocationService.new.get_geocode(@location)
#   end

  def forecast_service
    DarkSkyService.new.get_forecast(@location.latitude, @location.longitude)
  end
end
