class Api::V1::UsersController < ApplicationController

  def create
    user = User.new(user_params)
    user.update(api_key: user.api_key_generator)
    if user.save
      render json: UserSerializer.new(user).json, status: 201
    else
      errors = user.errors.full_messages.to_sentence
      render json: { errors: "Invalid credentials: #{errors}"}, status: 400
    end
  end

private
  def user_params
    json_parse(request)
  end
end
