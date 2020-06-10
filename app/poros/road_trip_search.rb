class RoadTripSearch
  def self.results(origin, destination)
    @origin = origin
    @destination = destination
    RoadTrip.new(origin,
                 destination,
                 travel_time,
                 arrival_time,
                 arrival_weather)
  end

  def self.travel_time
    GoogleService.travel_time_description(@origin, @destination)
  end

  def self.arrival_weather
    travel_time = GoogleService.travel_time_seconds(@origin, @destination)
    arrival_time = TimeCalculator.round_to_nearest_hour(travel_time)
    ForecastSearch.arrival_weather(@destination, arrival_time)
  end

  def self.arrival_time
    Time.now + GoogleService.travel_time_seconds(@origin, @destination)
  end
end
