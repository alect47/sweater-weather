class Api::V1::LocationController < ApplicationController
  def show
    location = LocationFacade.new(params[:location]).location_info
    render json: LocationSerializer.new(location)
  end
end
