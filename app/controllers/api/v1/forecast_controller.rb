class Api::V1::ForecastController < ApplicationController
  def show
    weather = WeatherService.report(location_params)
    render json: CurrentWeatherSerializer.new(weather).serializable_hash
  end

  private

  def location_params
    params.permit(:location)
  end
end
