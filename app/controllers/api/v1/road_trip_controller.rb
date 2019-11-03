class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:road_trip][:api_key])
    if user
      road_trip = RoadTripFacade.new(params[:road_trip][:origin],
                  params[:road_trip][:destination]).road_trip
      render json: RoadTripSerializer.new(road_trip)
    else
      render json: { errors: "Invalid or missing Api Key"}, status: 401
    end
  end
end
