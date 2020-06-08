class FoodSearch

  def self.result(food_params)
    @@destination = food_params['end']
    @@origin = food_params['start']

    Foodie.new(restaurant(food_params),
               travel_time,
               @@destination,
               short_forecast)
  end

  def self.travel_time
    GoogleService.get_travel_time(@@origin, @@destination)
  end

  def self.short_forecast
    ShortForecast.new(WeatherService.current(@@destination))
  end

  def self.restaurant(food_params)
    restaurant_info = FoodService.new(food_params).restaurant_search
    Restaurant.new(restaurant_info)
  end
end
