class HourlyWeather
  attr_reader :date, :time, :hour, :icon, :temp, :description
  def initialize(hourly_info)
    @date = Time.at(hourly_info[:dt]).in_time_zone.strftime('%d/%m/%Y')
    @time = hourly_info[:dt]
    @hour = Time.at(hourly_info[:dt]).in_time_zone.strftime('%H')
    @icon = hourly_info[:weather].first[:icon]
    @temp = hourly_info[:temp].to_i
    @description = hourly_info[:weather].first[:main]
  end
end
