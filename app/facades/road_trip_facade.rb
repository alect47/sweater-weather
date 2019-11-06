class RoadTripFacade

  def initialize(road_trip_params)
    @origin = road_trip_params[:origin]
    @destination = road_trip_params[:destination]
  end

  def road_trip
    RoadTrip.new(forecast, total_travel_time)
  end

  def forecast
    Forecast.new(forecast_service, location)
  end

  def arrival_time
    current_time = Time.now.to_i
    current_time + get_travel_time_num
  end

  def get_travel_time_num
    location_service_travel[:routes][0][:legs][0][:duration][:value]
  end

  def total_travel_time
    location_service_travel[:routes][0][:legs][0][:duration][:text]
  end

private

  def forecast_service
    @forecast_service ||=DarkSkyService.new.get_forecast(location.latitude, location.longitude, arrival_time)
  end

  def location_service_geocode
    @location_service  ||= LocationService.new.get_geocode(@destination)
  end

  def location_service_travel
    @location_service_travel  ||= LocationService.new.get_travel(@origin, @destination)
  end

  def location
    @location ||=Location.new(location_service_geocode)
  end

end
