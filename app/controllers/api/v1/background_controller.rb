class Api::V1::BackgroundController < ApplicationController
  def show
    images = BackgroundFacade.new(params[:location]).background
    render json: BackgroundSerializer.new(images)
  end
end
