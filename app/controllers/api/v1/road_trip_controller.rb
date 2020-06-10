class Api::V1::RoadTripController < ApplicationController
  before_action :valid_key?, :valid_params

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
      render json: ErrorGenerator.invalid_key, status: :unauthorized
    end
  end

  def valid_params
    if !road_trip_params.keys.include?(nil) &&
       !road_trip_params.values.include?(nil) &&
       !road_trip_params.values.include?('')
    else
      render json: ErrorGenerator.invalid_params, status: :bad_request
    end
  end
end
