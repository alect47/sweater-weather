class Api::V1::UsersController < ApplicationController
  #request.body.read
  # JSON.parse(request.body.read, symbolize_names: true) maybe put
  # in application controller
  def create
    binding.pry
    user = User.new(user_params)
    user.update(api_key: user.api_key_generator)
    if user.save
      render json: UserSerializer.new(user).json
    end
  end

private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
