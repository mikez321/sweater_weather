class ArrivalWeather
  attr_reader :temp, :description, :arrival_hour
  def initialize(weather)
    @temp = weather[:temp]
    @description = weather[:weather].first[:description]
    @arrival_hour = Time.at(weather[:dt]).getlocal.strftime('%H:%M')
  end
end
