class BackgroundFacade

  def initialize(location)
    @location = location
  end

  def background
    Background.new(flickr_service)
  end

  def flickr_service
    FlickrService.new.get_photos(@location.latitude, @location.longitude)
  end
end
