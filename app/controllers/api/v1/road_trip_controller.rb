class Api::V1::RoadTripController < ApplicationController

  def create
    road_trip_params = json_parse(request)
    if User.find_by(api_key: road_trip_params[:api_key])
      road_trip = RoadTripFacade.new(road_trip_params).road_trip
      render json: RoadTripSerializer.new(road_trip)
    else
      render json: { errors: "Invalid or missing Api Key"}, status: 401
    end
  end

end
