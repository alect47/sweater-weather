class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: road_trip_params[:api_key])
    if user
      road_trip = RoadTripFacade.new(params[:road_trip][:origin],
                  params[:road_trip][:destination]).road_trip
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
