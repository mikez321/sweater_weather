class Api::V1::BackgroundsController < ApplicationController
  def show
    background = BackgroundSearch.results(location_params)
    render json: BackgroundSerializer.new(background).serializable_hash
  end

  private

  def location_params
    params.permit(:location)
  end
end
