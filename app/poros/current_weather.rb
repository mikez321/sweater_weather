class CurrentWeather
  attr_reader :id, :location

  def initialize(current_weather)
    # @onecall = onecall
    @current_weather = current_weather
    @id = '1'
    @location = current_weather[:name]
  end

  def current
    @current_weather[:main][:temp].to_i
  end

  def min
    @current_weather[:main][:temp_min].to_i
  end

  def max
    @current_weather[:main][:temp_max].to_i
  end

  def description
    @current_weather[:weather].first[:description].titleize
  end

  def feels_like
    @current_weather[:main][:feels_like].to_i
  end

  def humidity
    @current_weather[:main][:humidity].to_i
  end

  # def uvi
  #   @onecall[:current][:uvi]
  # end
  #
  # def visibility
  #   if @onecall[:current][:visibility].nil?
  #     'Unavailable'
  #   else
  #     @onecall[:current][:visibility] / 1609.34
  #   end
  # end
  #
  # def sunrise
  #   Time.at(@onecall[:current][:sunrise]).strftime("%l:%m %p")
  # end
  #
  # def sunset
  #   Time.at(@onecall[:current][:sunset]).strftime("%l:%m %p")
  # end
  #
  # def time
  #   Time.at(@onecall[:current][:dt]).strftime("%l:%m %p, %B %-d")
  # end
end
