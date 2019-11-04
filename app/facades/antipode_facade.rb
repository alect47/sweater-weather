class AntipodeFacade
  attr_reader :location

  def initialize(location)
    @location = location
  end

  def antipode
    Antipode.new(antipode_service, location)
  end

  def antipode_service
    AntipodeService.new.get_antipode(@location.latitude, @location.longitude)
  end
end
