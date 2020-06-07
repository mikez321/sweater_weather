require 'rails_helper'

describe 'forecast searching' do
  before(:each) do
    @location = 'Denver,CO'
  end

  it 'returns a current weather object' do
    current = ForecastSearch.current_weather(@location)

    expect(current).to be_a(CurrentWeather)
  end

  it 'returns an array of houlry weather object' do
    hourly = ForecastSearch.hourly_weather(@location)

    expect(hourly).to be_an(Array)
    expect(hourly.first).to be_a(HourlyWeather)
  end

  it 'returns an array of daily weather object' do
    daily = ForecastSearch.daily_weather(@location)

    expect(daily).to be_an(Array)
    expect(daily.first).to be_a(DailyWeather)
  end

  it 'returns a forecast object for a location' do
    weather = ForecastSearch.results(@location)

    expect(weather).to be_a(Forecast)
  end
end
