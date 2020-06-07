class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :city_name, :current, :daily, :hourly
end
