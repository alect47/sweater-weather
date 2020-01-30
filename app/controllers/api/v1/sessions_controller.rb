class Api::V1::SessionsController < ApplicationController

  def create
    session_params = json_parse(request)
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user).json
    else
      render json: { errors: "Invalid username or password"}, status: 400
    end
  end
end
