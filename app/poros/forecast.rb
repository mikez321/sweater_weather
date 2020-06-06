class Forecast
  attr_reader :current, :hourly, :daily, :id

  def initialize(current_weather, hourly_weather, daily_weather)
    @current = current_weather
    @hourly = hourly_weather
    @daily = daily_weather
    @id = '1'
  end
end
