class FoodSearch
  def self.result(food_params)
    end_location = food_params[:end_location]
    start_coords = GoogleService.get_coordinates(food_params['start'])
    dest_coords = GoogleService.get_coordinates(food_params['end'])
    travel_time = GoogleService.get_travel_time(food_params['start'], food_params['end'])
    # destination_weather = WeatherService.current(food_params['end'])
    destination_forecast = ForecastSearch.results(food_params['end'])
    conn = Faraday.get('https://developers.zomato.com/api/v2.1/search') do |f|
      f.headers['user-key'] = ENV['ZOMATO_KEY']
      f.params[:lat] = dest_coords[:lat]
      f.params[:lon] = dest_coords[:lng]
      f.params[:q] = food_params['search']
    end
    json = JSON.parse(conn.body, symbolize_names: true)

    restaurant = Restaurant.new(json[:restaurants].first)

    Foodie.new(restaurant, travel_time, end_location)
  end
end
