class ForecastFacade

  def initialize(location)
    @location = location
  end

  def forecast
    Forecast.new(forecast_service, location)
  end

  def forecast_service
    DarkSkyService.new.get_forecast(location.latitude, location.longitude)
  end

  def location
    LocationFacade.new(@location).location_info
  end
end
