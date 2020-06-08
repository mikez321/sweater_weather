class FoodSearch
  def self.result(food_params)
    Foodie.new(restaurant(food_params), travel_time(food_params), end_location(food_params), short_forecast(food_params))
  end

  def self.travel_time(food_params)
    GoogleService.get_travel_time(food_params['start'], food_params['end'])
  end

  def self.short_forecast(food_params)
    destination_weather = WeatherService.current(food_params['end'])
    ShortForecast.new(destination_weather)
  end

  def self.end_location(food_params)
    food_params['end']
  end

  def self.restaurant(food_params)
    restaurant_info = FoodService.new(food_params).restaurant_search
    Restaurant.new(restaurant_info)
  end
end
