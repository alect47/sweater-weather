class BackgroundFacade

  def initialize(location)
    @location = location
  end

  def background
    background_1 = Background.new(flickr_service)
    background_1.make_image_url
    background_1
  end

  def flickr_service
    FlickrService.new.get_photos(location.latitude, location.longitude)
  end

  def location
    LocationFacade.new(@location).location_info
  end
end
