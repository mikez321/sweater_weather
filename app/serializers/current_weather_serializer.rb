class CurrentWeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :date,
             :time,
             :conditions,
             :icon,
             :current_temp,
             :feels_like,
             :high,
             :low,
             :humidity,
             :visibility
end
