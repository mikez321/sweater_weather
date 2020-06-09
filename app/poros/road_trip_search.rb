class RoadTripSearch
  def self.results(origin, destination)
    directions = GoogleService.get_directions(origin, destination)
    travel_time = directions[:routes].first[:legs].first[:duration][:text]
    arrival_time = (Time.now + directions[:routes].first[:legs].first[:duration][:value]).beginning_of_hour.to_i
    hourly_weather = WeatherService.hourly(destination)[:hourly]
    weather_at_arrival = hourly_weather.find { |hour| hour[:dt] == arrival_time }
    arrival_weather = ArrivalWeather.new(weather_at_arrival)
    RoadTrip.new(origin, destination, travel_time, arrival_weather)
  end
end
