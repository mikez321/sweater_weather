class ArrivalWeather
  attr_reader :temp, :description
  def initialize(weather)
    @temp = weather[:temp]
    @description = weather[:weather].first[:description]
  end
end
