class DestinationWeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location,
            :current,
            :min,
            :max,
            :feels_like,
            :description,
            :humidity,
            :uvi,
            :visibility,
            :sunrise,
            :sunset,
            :time
end
