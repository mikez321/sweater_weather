class Forecast
  attr_reader :current, :hourly, :daily, :id, :city_name

  def initialize(current_weather, hourly_weather, daily_weather, city_name)
    @city_name = city_name['location']
    @current = current_weather
    @hourly = hourly_weather
    @daily = daily_weather
    @id = '1'
  end
end
