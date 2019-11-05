class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.update(api_key: user.api_key_generator)
    if user.save
      render json: UserSerializer.new(user).json
    end
    # location = LocationFacade.new(params["location"]).location_info
    # render json: LocationSerializer.new(location)
  end

private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
