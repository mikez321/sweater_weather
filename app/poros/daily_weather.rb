class DailyWeather
  attr_reader :day,
              :icon,
              :description,
              :rain,
              :temp,
              :high_temp,
              :low_temp,
              :feels_like_day,
              :sunrise,
              :sunset,
              :uvi

  def initialize(daily_info)
    @date = Time.at(daily_info[:dt]).strftime("%m/%d/%Y")
    @time = daily_info[:dt]
    @day = Time.at(daily_info[:dt]).strftime("%A")
    @icon = daily_info[:weather].first[:icon]
    @description = daily_info[:weather].first[:main]
    @rain = daily_info[:rain]
    @temp = daily_info[:temp][:day]
    @high_temp = daily_info[:temp][:max]
    @low_temp = daily_info[:temp][:min]
    @feels_like_day = daily_info[:feels_like][:day]
    @sunrise = Time.at(daily_info[:sunrise]).strftime("%l:%m %-p")
    @sunset = Time.at(daily_info[:sunset]).strftime("%l:%m %-p")
    @uvi = daily_info[:uvi]
  end
end
