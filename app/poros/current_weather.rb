class CurrentWeather
  attr_reader :date,
              :time,
              # :name,
              :conditions,
              :icon,
              :current_temp,
              :feels_like,
              :high,
              :low,
              :humidity
              :visibility

  def initialize(current_info)
    @date = Time.at(current_info[:current][:dt]).strftime("%m/%d/%Y")
    @time = current_info[:current][:dt]
    @conditions = current_info[:current][:weather].first[:description]
    @icon = current_info[:current][:weather].first[:icon]
    @current_temp = current_info[:current][:temp].to_i
    @feels_like = current_info[:current][:feels_like].to_i
    @humidity = current_info[:current][:humidity].to_i
    @visibility = current_info[:visibility].nil? ? ('unvailable') : (current_info[:visibility] / 1609.34)
    # @date = Time.at(current_info[:dt]).strftime("%m/%d/%Y")
    # @time = current_info[:dt]
    # @name = current_info[:name]
    # @conditions = current_info[:weather].first[:description].titleize
    # @icon = current_info[:weather].first[:icon]
    # @current_temp = current_info[:main][:temp].to_i
    # @feels_like = current_info[:main][:feels_like].to_i
    # @high = current_info[:main][:temp_max].to_i
    # @low = current_info[:main][:temp_min].to_i
    # @humidity = current_info[:main][:humidity].to_i
  end
end
