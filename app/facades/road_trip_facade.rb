class RoadTripFacade

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def road_trip
    RoadTrip.new(forecast, total_travel_time)
  end

  def forecast
    Forecast.new(forecast_service, location)
  end

  def forecast_service
    DarkSkyService.new.get_forecast(location.latitude, location.longitude, arrival_time)
  end

  def arrival_time
    current_time = Time.now.to_i
    arrival_time = current_time + get_travel_time
  end

  def get_travel_time
    trip = LocationService.new.get_travel(@origin, @destination)
    trip[:routes][0][:legs][0][:duration][:value]
  end

  def total_travel_time
    trip = LocationService.new.get_travel(@origin, @destination)
    trip[:routes][0][:legs][0][:duration][:text]
  end

  def location
    location = LocationService.new.get_geocode(@destination)
    Location.new(location)
  end

end
