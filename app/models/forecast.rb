class Forecast
  attr_reader :id, :address, :currently, :hourly, :daily, :today, :tonight

  def initialize(forecast_hash, location)
    @id = rand(0..999999)
    @currently = forecast_hash[:currently]
    @today = forecast_hash[:daily][:data][0]
    @hourly = forecast_hash[:hourly]
    @daily = forecast_hash[:daily][:data]
    @tonight= tonight
    @address = location.address
  end

  def tonight
    hour = @hourly[:data].find do |hour|
      hour[:icon].include?("night")
    end
    @tonight = hour[:summary]
  end
end
