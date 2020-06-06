class WeatherService

  def self.report(location)
    location_coordinates = GoogleService.get_coordinates(location)

    # response = Faraday.get('http://api.openweathermap.org/data/2.5/onecall') do |f|
    #   f.params[:appid] = ENV['WEATHER_KEY']
    #   f.params[:lat] = location_coordinates[:lat].to_s
    #   f.params[:lon] = location_coordinates[:lng].to_s
    #   f.params[:units] = 'imperial'
    #   f.params[:exclue] = 'hourly, minutely, daily'
    # end

    onecall_weather = self.conn.get('onecall') do |r|
      r.params[:lat] = location_coordinates[:lat].to_s
      r.params[:lon] = location_coordinates[:lng].to_s
      r.params[:units] = 'imperial'
      r.params[:exclude] = 'hourly, minutely, daily'
    end

    current_weather = self.conn.get('weather') do |r|
      r.params[:lat] = location_coordinates[:lat].to_s
      r.params[:lon] = location_coordinates[:lng].to_s
      r.params[:units] = 'imperial'
    end

    onecall_response = JSON.parse(onecall_weather.body, symbolize_names: true)
    current_response = JSON.parse(current_weather.body, symbolize_names: true)
    DestinationWeather.new(onecall_response, current_response)
  end

  def self.conn
    Faraday.new('http://api.openweathermap.org/data/2.5') do |f|
      f.params[:appid] = ENV['WEATHER_KEY']
    end
  end

end
