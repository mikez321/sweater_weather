class Restaurant
  attr_reader :name, :location

  def initialize(restaurant_info)
    @name = restaurant_info[:restaurant][:name]
    @location = restaurant_info[:restaurant][:location][:address]
  end
end
