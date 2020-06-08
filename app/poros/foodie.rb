class Foodie
  attr_reader :id, :destination_forecast, :restaurant, :time

  def initialize(destination_forecast, restaurant, time)
    @id = 1
    @destination_forecast = destination_forecast.current.current_temp
    @restaurant = restaurant
    @time = time
  end
end
