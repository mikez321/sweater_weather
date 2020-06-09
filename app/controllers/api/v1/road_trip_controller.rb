class Api::V1::RoadTripController < ApplicationController
  before_action :valid_key?

  def create
    origin = road_trip_params[:origin]
    destination = road_trip_params[:destination]
    road_trip = RoadTripSearch.results(origin, destination)
    render json: RoadTripSerializer.new(road_trip)
  end

  private

  def road_trip_params
    params.permit(:origin, :destination, :api_key)
  end

  def valid_key?
    api_key = road_trip_params[:api_key]
    if !api_key.nil? && !User.find_by(api_key: api_key).nil?
    else
      invalid_key_error = ErrorGenerator.invalid_key
      render json: invalid_key_error, status: :unauthorized
    end
  end
end
