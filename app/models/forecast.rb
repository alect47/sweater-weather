class Forecast
  attr_reader :address
  def initialize(forecast_hash, location)
    @currently = forecast_hash[:currently]
    @hourly = forecast_hash[:hourly]
    @daily = forecast_hash[:daily]
    @address = location.address
  end
end
