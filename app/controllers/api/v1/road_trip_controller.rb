class Api::V1::RoadTripController < ApplicationController
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
end
