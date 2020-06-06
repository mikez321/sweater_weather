class CurrentWeather
  attr_reader :time
  def initialize(current_info)
    @current = current_info
    @time = Time.at(current_info[:dt]).strftime("%l:%m %p, %B %-d")
  end

  def name
    @current[:name]
  end

  def conditions
    @current[:weather].first[:description].titleize
  end

  def icon
    @current[:weather].first[:icon]
  end

  def current_temp
    @current[:main][:temp].to_i
  end

  def feels_like
    @current[:main][:feels_like].to_i
  end

  def high
    @current[:main][:temp_max].to_i
  end

  def low
    @current[:main][:temp_min].to_i
  end

  def humidity
    @current_info[:main][:humidity].to_i
  end
end
