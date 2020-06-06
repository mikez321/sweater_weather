class HourlyWeather
  def initialize(hourly_info)
    @info = hourly_info
  end

  def hour
    Time.at(@info[:dt]).strftime("%l %p")
  end

  def icon
    @info[:weather].first[:icon]
  end

  def temp
    @info[:temp].to_i
  end
end
