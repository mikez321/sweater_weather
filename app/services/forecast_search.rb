class ForecastSearch
  def self.results(city_name)
    current_weather = WeatherService.current(city_name)
    hourly_weather = WeatherService.hourly(city_name)
    daily_weather = WeatherService.daily(city_name)
    Forecast.new(current_weather, hourly_weather, daily_weather, city_name)
  end
end
