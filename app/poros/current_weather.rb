class CurrentWeather
  attr_reader :date,
              :time,
              :conditions,
              :icon,
              :current_temp,
              :feels_like,
              :high,
              :low,
              :humidity,
              :visibility

  def initialize(current_info)
    @date = Time.at(current_info[:current][:dt]).in_time_zone.strftime('%m/%d/%Y')
    @time = current_info[:current][:dt]
    @conditions = current_info[:current][:weather].first[:description]
    @icon = current_info[:current][:weather].first[:icon]
    @current_temp = current_info[:current][:temp]
    @feels_like = current_info[:current][:feels_like]
    @humidity = current_info[:current][:humidity]
    @visibility = current_info[:visibility].nil? ? 'unvailable' : current_info[:visibility] / 1609.34
  end
end
