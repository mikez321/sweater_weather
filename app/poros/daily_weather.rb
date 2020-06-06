class DailyWeather
  def initialize(daily_info)
    @info = daily_info
  end

  def day
    Time.at(@info[:dt]).strftime("%A")
  end

  def icon
    @info[:weather].first[:icon]
  end

  def description
    @info[:weather].first[:main]
  end

  def rain
    @info[:rain]
  end

  def high_temp
    @info[:temp][:max].to_i
  end

  def low_temp
    @info[:temp][:min].to_i
  end
end
