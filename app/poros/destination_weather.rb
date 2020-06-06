class DestinationWeather
  attr_reader :id, :location

  def initialize(onecall, current)
    @onecall = onecall
    @current = current
    @id = '1'
    @location = current[:name]
  end

  def current
    @current[:main][:temp].to_i
  end

  def min
    @current[:main][:temp_min].to_i
  end

  def max
    @current[:main][:temp_max].to_i
  end

  def description
    @current[:weather].first[:description].titleize
  end

  def feels_like
    @current[:main][:feels_like].to_i
  end

  def humidity
    @current[:main][:humidity].to_i
  end

  def uvi
    @onecall[:current][:uvi]
  end

  def visibility
    if @onecall[:current][:visibility].nil?
      'Unavailable'
    else
      @onecall[:current][:visibility] / 1609.34
    end
  end

  def sunrise
    Time.at(@onecall[:current][:sunrise]).strftime("%l:%m %p")
  end

  def sunset
    Time.at(@onecall[:current][:sunset]).strftime("%l:%m %p")
  end

  def time
    Time.at(@onecall[:current][:dt]).strftime("%l:%m %p, %B %-d")
  end
end
