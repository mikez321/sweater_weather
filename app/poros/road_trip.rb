class RoadTrip
  attr_reader :id,
              :origin,
              :destination,
              :travel_time,
              :arrival_weather

  def initialize(origin, destination, travel_time, arrival_weather)
    @id = 1
    @origin = origin
    @destination = destination
    @travel_time = travel_time
    @arrival_weather = arrival_weather
  end
end
