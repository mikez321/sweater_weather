class CurrentWeather
  attr_reader :time,
              :name,
              :conditions,
              :icon,
              :current_temp,
              :feels_like,
              :high,
              :low,
              :humidity

  def initialize(current_info)
    # @current = current_info
    @time = Time.at(current_info[:dt]).strftime("%l:%m %p, %B %-d")
    @name = current_info[:name]
    @conditions = current_info[:weather].first[:description].titleize
    @icon = current_info[:weather].first[:icon]
    @current_temp = current_info[:main][:temp].to_i
    @feels_like = current_info[:main][:feels_like].to_i
    @high = current_info[:main][:temp_max].to_i
    @low = current_info[:main][:temp_min].to_i
    @humidity = current_info[:main][:humidity].to_i
  end
end
