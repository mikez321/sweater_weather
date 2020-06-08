class FoodieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :restaurant, :end_location, :travel_time
end
