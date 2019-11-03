class Api::V1::UsersController < ApplicationController
  #request.body.read
  # JSON.parse(request.body.read, symbolize_names: true) maybe put
  # in application controller
  def create
    # binding.pry
    user_params = json_parse(request)
    user = User.new(user_params)
    user.update(api_key: SecureRandom.hex)
    if user.save
      render json: UserSerializer.new(user).json
    else
      errors = user.errors.full_messages.to_sentence
      render json: { errors: "Invalid credentials: #{errors}"}, status: 400
    end
  end

private

  # def user_params
  #   json_parse(request)
  # end
end
