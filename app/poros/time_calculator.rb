class TimeCalculator
  def self.round_to_nearest_hour(travel_time)
    TimeCalculator.new(travel_time).arrival_time
  end

  def initialize(travel_time)
    @arrive = Time.now.getlocal + travel_time
  end

  def next_hour
    (@arrive.at_end_of_hour + 1.second).to_i
  end

  def this_hour
    @arrive.at_beginning_of_hour.to_i
  end

  def arrival_time
    seconds_to_next_hour = (@arrive.to_i - next_hour).abs
    seconds_to_this_hour = (@arrive.to_i - this_hour).abs
    seconds_to_next_hour < seconds_to_this_hour ? next_hour : this_hour
  end
end
