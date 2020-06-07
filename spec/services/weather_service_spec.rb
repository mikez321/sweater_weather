require 'rails_helper'

describe 'weather service' do
  it 'returns the current weather in a hash' do
    location = 'Denver, CO'

    current_weather = WeatherService.current(location)

    expect(current_weather).to be_a(Hash)
  end

  it 'returns the hourly weather in a hash' do

    location = 'Denver, CO'

    hourly_weather = WeatherService.hourly(location)

    expect(hourly_weather).to be_a(Hash)
    expect(hourly_weather[:hourly]).to be_an(Array)
  end

  it 'returns the daily weather in a hash' do

    location = 'Denver, CO'

    daily_weather = WeatherService.daily(location)

    expect(daily_weather).to be_a(Hash)
    expect(daily_weather.first).to be_an(Array)
  end
end
