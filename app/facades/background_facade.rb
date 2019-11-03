class BackgroundFacade

  def initialize(location)
    @location = location
  end

  def background
    background_1 = Background.new(flickr_service)
    background_1.make_image_url
    background_1
  end

  def location
    Location.new(location_service)
  end

private

  def flickr_service
    @flicker_service ||=FlickrService.new.get_photos(location.latitude, location.longitude)
  end

  def location_service
    @location_service ||= LocationService.new.get_geocode(@location)
  end
end
