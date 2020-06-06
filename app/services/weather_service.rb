class WeatherService

  def self.report(location)
    location_coordinates = GoogleService.get_coordinates(location)

    response = Faraday.get('http://api.openweathermap.org/data/2.5/weather') do |f|
      f.params[:appid] = ENV['WEATHER_KEY']
      f.params[:lat] = location_coordinates[:lat].to_s
      f.params[:lon] = location_coordinates[:lng].to_s
    end

    weather_info = JSON.parse(response.body, symbolize_names: true)
    DestinationWeather.new(weather_info)
  end

end
