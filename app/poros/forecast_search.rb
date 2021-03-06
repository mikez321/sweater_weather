class ForecastSearch
  def self.results(city_name)
    Forecast.new(current_weather(city_name),
                 hourly_weather(city_name),
                 daily_weather(city_name),
                 city_name)
  end

  def self.current_weather(city_name)
    current_info = WeatherService.current(city_name)
    CurrentWeather.new(current_info)
  end

  def self.hourly_weather(city_name)
    hourly_info = WeatherService.hourly(city_name)
    hourly_info[:hourly].map { |info| HourlyWeather.new(info) }
  end

  def self.daily_weather(city_name)
    daily_info = WeatherService.daily(city_name)
    daily_info[:daily].map { |info| DailyWeather.new(info) }
  end

  def self.arrival_weather(city_name, arrival_time)
    hourly_weather = WeatherService.hourly(city_name)[:hourly]
    weather_at_arrival = hourly_weather.find { |hour| hour[:dt] == arrival_time }
    ArrivalWeather.new(weather_at_arrival)
  end
end
