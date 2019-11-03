class Api::V1::ForecastController < ApplicationController
  def show
    location = LocationFacade.new(params[:location]).location_info
    forecast = ForecastFacade.new(location).forecast
    render json: ForecastSerializer.new(forecast)
  end
end
