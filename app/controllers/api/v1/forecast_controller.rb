class Api::V1::ForecastController < ApplicationController
  def show
    forecast = ForecastSearch.results(location_params)
    render json: ForecastSerializer.new(forecast).serializable_hash
  end

  private

  def location_params
    params.permit(:location)
  end
end
