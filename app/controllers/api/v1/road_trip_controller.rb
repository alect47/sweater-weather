class Api::V1::RoadTripController < ApplicationController

  def create
    if User.find_by(api_key: road_trip_params[:api_key])
      road_trip = RoadTripFacade.new(road_trip_params).road_trip
      render json: RoadTripSerializer.new(road_trip)
    else
      render json: { errors: "Invalid or missing Api Key"}, status: 401
    end
  end

  private

  def road_trip_params
    params.require(:road_trip).permit(:api_key, :origin, :destination)
  end
end
