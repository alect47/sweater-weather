class AntipodeFacade
  attr_reader :location, :forecast

  #need to also get antipode city name
  def initialize(location)
    @location = location
    @forecast = forecast
  end

  # def forecast
  #   ForecastFacade.new(antipode_service).forecast
  # end

  def antipode_city
    lat = antipode_service[:data][:attributes][:lat]
    long = antipode_service[:data][:attributes][:long]
    location = LocationService.new.get_address(lat, long)[:plus_code][:compound_code]

    # LocationService.new.get_geocode(location)
    location_object = LocationFacade.new(location).location_info
  end

  def antipode_city_name
    lat = antipode_service[:data][:attributes][:lat]
    long = antipode_service[:data][:attributes][:long]
    location = LocationService.new.get_address(lat, long)[:plus_code][:compound_code]

  end

  def antipode_city_forecast
    lat = antipode_service[:data][:attributes][:lat]
    long = antipode_service[:data][:attributes][:long]

    #this makes the dark sky hash which will need to be converted into Forecast object
    # and passed to antipode model
    # need to also make a location object
    ForecastFacade.new(antipode_city).forecast
    # antipode_forecast = DarkSkyService.new.get_forecast(lat, long)
  end

  def antipode
    binding.pry
    Antipode.new(antipode_city_forecast, antipode_city_name, @location)
  end

  def antipode_service
    AntipodeService.new.get_antipode(@location.latitude, @location.longitude)
  end
end
