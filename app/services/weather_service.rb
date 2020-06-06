class WeatherService

  def self.current(city_name)
    city_coordinates = city_coordinates(city_name)
    response = conn.get('onecall') do |conn|
      conn.params[:lat] = city_coordinates[:lat].to_s
      conn.params[:lon] = city_coordinates[:lng].to_s
      conn.params[:exclude] = 'minutely, hourly, daily'
      conn.params[:units] = 'imperial'
    end
    current_info = JSON.parse(response.body, symbolize_names: true)
    current = CurrentWeather.new(current_info)
  end

  def self.hourly(city_name)
    city_coordinates = city_coordinates(city_name)
    response = conn.get('onecall') do |conn|
      conn.params[:lat] = city_coordinates[:lat].to_s
      conn.params[:lon] = city_coordinates[:lng].to_s
      conn.params[:exclude] = 'current, minutely, daily'
      conn.params[:units] = 'imperial'
    end
    hourly_response = JSON.parse(response.body, symbolize_names: true)
    hourly_response[:hourly].map do |hourly_info|
      HourlyWeather.new(hourly_info)
    end
  end

  def self.daily(city_name)
    city_coordinates = city_coordinates(city_name)
    response = conn.get('onecall') do |conn|
      conn.params[:lat] = city_coordinates[:lat].to_s
      conn.params[:lon] = city_coordinates[:lng].to_s
      conn.params[:exclude] = 'current, minutely, hourly'
      conn.params[:units] = 'imperial'
    end
    daily_response = JSON.parse(response.body, symbolize_names: true)
    daily_response[:daily].map do |daily_info|
      DailyWeather.new(daily_info)
    end
  end

  private

  def self.conn
    Faraday.new('http://api.openweathermap.org/data/2.5') do |f|
      f.params[:appid] = ENV['WEATHER_KEY']
    end
  end

  def self.city_coordinates(city_name)
    GoogleService.get_coordinates(city_name)
  end

end
