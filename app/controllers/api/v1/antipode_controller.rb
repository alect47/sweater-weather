class Api::V1::AntipodeController < ApplicationController
  def show
    location = LocationFacade.new(params[:location]).location_info
    forecast = ForecastFacade.new(location).forecast
    antipode = AntipodeFacade.new(location, forecast).antipode
    # images = background.background
    # images.make_image_url
    render json: AntipodeSerializer.new(antipode)
  end
end
