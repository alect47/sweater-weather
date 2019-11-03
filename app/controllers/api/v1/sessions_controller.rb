class Api::V1::SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      # this line might not be necessary
      session[:user_id] = user.id
      render json: UserSerializer.new(user).json
    else
      render json: { errors: "Invalid username or password"}, status: 400
    end
  end

end
