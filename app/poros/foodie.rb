class Foodie
  attr_reader :id, :restaurant, :end_location, :travel_time

  def initialize(restaurant, end_location, travel_time)
    @id = 1
    @restaurant = restaurant
    @end_location = end_location
    @travel_time = travel_time
  end
end
