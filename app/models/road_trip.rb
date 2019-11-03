class RoadTrip
  attr_reader :id, :forecast, :travel_time
  def initialize(forecast, travel_time)
    @id = rand(0..999999)
    binding.pry
    @forecast = forecast
    @travel_time = travel_time
  end
end
