class Foodie
  attr_reader :id, :restaurant, :end_location, :travel_time, :forecast

  def initialize(restaurant, end_location, travel_time, short_forecast)
    @id = 1
    @restaurant = restaurant
    @end_location = end_location
    @travel_time = travel_time
    @forecast = short_forecast
  end
end
