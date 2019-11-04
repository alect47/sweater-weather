class Api::V1::BackgroundController < ApplicationController
  def show
    location = LocationFacade.new(params[:location]).location_info
    background = BackgroundFacade.new(location)
    images = background.background
    images.make_image_url
    render json: BackgroundSerializer.new(images)
  end
end
