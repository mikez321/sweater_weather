require 'rails_helper'

describe 'weather service' do
  it 'creates a current_weather object' do
    location = 'Denver, CO'

    current_weather = WeatherService.current(location)

    expect(current_weather).to be_a(CurrentWeather)
  end

  it 'creates hourly weather objects' do

    location = 'Denver, CO'

    hourly_weather = WeatherService.hourly(location)

    expect(hourly_weather).to be_an(Array)
    expect(hourly_weather.first).to be_an(HourlyWeather)
  end

  it 'creates daily weather objects' do

    location = 'Denver, CO'

    daily_weather = WeatherService.daily(location)

    expect(daily_weather).to be_an(Array)
    expect(daily_weather.first).to be_a(DailyWeather)
  end
end
