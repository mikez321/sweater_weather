class FoodSearch

  def self.result(food_params)
    @@destination = food_params['end']
    @@origin = food_params['start']

    Foodie.new(restaurant(food_params), travel_time(food_params), @@destination, short_forecast(food_params))
  end

  def self.travel_time(food_params)
    GoogleService.get_travel_time(@@origin, @@destination)
  end

  def self.short_forecast(food_params)
    destination_weather = WeatherService.current(@@destination)
    ShortForecast.new(destination_weather)
  end

  def self.restaurant(food_params)
    restaurant_info = FoodService.new(food_params).restaurant_search
    Restaurant.new(restaurant_info)
  end
end
