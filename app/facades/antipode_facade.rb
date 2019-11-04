class AntipodeFacade
  attr_reader :location

  #need to also get antipode city name
  def initialize(location, forecast)
    @location = location
    @forecast = forecast
  end

  def antipode
    Antipode.new(antipode_service, @forecast)
  end

  def antipode_service
    AntipodeService.new.get_antipode(@location.latitude, @location.longitude)
  end
end
