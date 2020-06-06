class HourlyWeather
  attr_reader :date, :time, :hour, :icon, :temp
  def initialize(hourly_info)
    @date = Time.at(hourly_info[:dt]).strftime("%d/%m/%Y")
    @time = hourly_info[:dt]
    @hour = Time.at(hourly_info[:dt]).strftime("%l %p")
    @icon = hourly_info[:weather].first[:icon]
    @temp = hourly_info[:temp].to_i
  end

end
