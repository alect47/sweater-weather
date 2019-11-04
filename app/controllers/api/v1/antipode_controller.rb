class Api::V1::AntipodeController < ApplicationController
  def show
    location = LocationFacade.new(params[:location]).location_info
    antipode = AntipodeFacade.new(location).antipode
    render json: AntipodeSerializer.new(antipode)
  end
end
