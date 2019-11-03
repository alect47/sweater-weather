class Forecast
  attr_reader :id, :address, :currently, :hourly, :daily, :today

  # think about refactoring this to make hash look different
  # maybe add tonight?
  def initialize(forecast_hash, location)
    @id = rand(0..999999)
    @currently = forecast_hash[:currently]
    @today = forecast_hash[:daily][:data][0]
    @hourly = forecast_hash[:hourly]
    @daily = forecast_hash[:daily][:data]
    @address = location.address
  end
end
