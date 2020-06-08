class ShortForecast
  attr_reader :summary, :temperature

  def initialize(forecast)
    @summary = forecast[:current][:weather].first[:description]
    @temperature = forecast[:current][:temp]
  end
end
