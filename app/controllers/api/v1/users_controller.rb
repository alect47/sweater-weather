class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    binding.pry
    user.update_attribute(:api_key, User.api_key_generator)
    # location = LocationFacade.new(params["location"]).location_info
    # render json: LocationSerializer.new(location)
  end

private

  def user_params
    params.permit(:email, :password)
  end
end
