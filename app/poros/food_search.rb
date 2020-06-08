class FoodSearch
  def self.result(food_params)
    end_location = food_params['end']
    travel_time = GoogleService.get_travel_time(food_params['start'], food_params['end'])
    destination_weather = WeatherService.current(food_params['end'])
    short_forecast = ShortForecast.new(destination_weather)
    conn = FoodService.new(food_params).food_search
    json = JSON.parse(conn.body, symbolize_names: true)

    restaurant = Restaurant.new(json[:restaurants].first)

    Foodie.new(restaurant, travel_time, end_location, short_forecast)
  end
end
