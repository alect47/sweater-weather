class RoadTrip
  attr_reader :id, :temperature, :summary, :travel_time
  def initialize(forecast, travel_time)
    @id = rand(0..999999)
    @temperature = forecast.currently[:temperature]
    @summary = forecast.currently[:summary]
    @travel_time = travel_time
  end
end
