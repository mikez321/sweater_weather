class Foodie
  attr_reader :id, :restaurant, :travel_time, :end_location, :forecast

  def initialize(restaurant, travel_time, end_location, short_forecast)
    @id = 1
    @restaurant = restaurant
    @travel_time = travel_time
    @end_location = end_location
    @forecast = short_forecast
  end
end
