class ForecastFacade

  def initialize(location)
    @location = location
  end

  def forecast
    Forecast.new(forecast_service, location)
  end

private

  def forecast_service
    @forecast_service ||= DarkSkyService.new.get_forecast(location.latitude, location.longitude)
  end

  def location
    @location_1 ||= Location.new(location_service)
  end

  def location_service
    @location_service ||= LocationService.new.get_geocode(@location)
  end
end
