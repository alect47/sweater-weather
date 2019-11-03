class Api::V1::LocationController < ApplicationController
  def show
    location_facade = LocationFacade.new(params["location"])
    location = location_facade.location_info
    render json: LocationSerializer.new(location)
  end
end
