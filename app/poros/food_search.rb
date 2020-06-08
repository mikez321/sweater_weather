class FoodSearch
  def self.result(food_params)
    start_coords = GoogleService.get_coordinates(food_params['start'])
    dest_coords = GoogleService.get_coordinates(food_params['end'])
    destination_weather = WeatherService.current(food_params['end'])
    conn = Faraday.get('https://developers.zomato.com/api/v2.1/search') do |f|
      f.headers['user-key'] = ENV['ZOMATO_KEY']
      f.params[:lat] = dest_coords[:lat]
      f.params[:lon] = dest_coords[:lng]
      f.params[:q] = food_params['search']
    end
  end
end
