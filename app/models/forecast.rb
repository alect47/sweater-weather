class Forecast
  attr_reader :id, :address, :currently, :tonight, :hourly, :daily, :today

  def initialize(forecast_hash, location)
    @id = rand(0..999999)
    @currently = forecast_hash[:currently]
    @today = forecast_hash[:daily][:data][0]
    @hourly = forecast_hash[:hourly]
    @daily = forecast_hash[:daily][:data]
    @tonight= ("#{tonight} and then #{tonight_last}")
    @address = location.address
  end

  def tonight
    hour = @hourly[:data][0..20].find do |hour|
      hour[:icon].include?("night")
    end
    hour[:summary]
  end

  def tonight_last
    hour = @hourly[:data][0..20].find_all do |hour|
      hour[:icon].include?("night")
    end.last
    hour[:summary]
  end
end
