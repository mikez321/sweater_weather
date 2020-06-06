class WeatherService

  def self.current(city_name)
    city_coordinates = GoogleService.get_coordinates(city_name)

    response = Faraday.get('http://api.openweathermap.org/data/2.5/weather') do |f|
      f.params[:appid] = ENV['WEATHER_KEY']
      f.params[:lat] = city_coordinates[:lat].to_s
      f.params[:lon] = city_coordinates[:lng].to_s
    end

    JSON.parse(response.body, symbolize_names: true)
  end

end
