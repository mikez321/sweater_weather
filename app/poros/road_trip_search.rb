class RoadTripSearch
  def self.results(origin, destination)
    @origin = origin
    @destination = destination
    RoadTrip.new(origin,
                 destination,
                 travel_time,
                 arrival_weather)
  end

  def self.travel_time
    GoogleService.travel_time_description(@origin, @destination)
  end

  def self.arrival_weather
    travel_time = GoogleService.travel_time_seconds(@origin, @destination)
    arrival_time = (Time.now + travel_time).beginning_of_hour.to_i
    ForecastSearch.arrival_weather(@destination, arrival_time)
  end
end
