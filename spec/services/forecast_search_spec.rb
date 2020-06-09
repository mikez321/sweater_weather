require 'rails_helper'

describe 'forecast searching' do
  before(:each) do
    @location = 'Denver,CO'
  end

  it 'returns a current weather object' do
    current = ForecastSearch.current_weather(@location)

    expect(current).to be_a(CurrentWeather)
    expect(current.conditions).to_not be_nil
    expect(current.current_temp).to_not be_nil
    expect(current.date).to_not be_nil
    expect(current.feels_like).to_not be_nil
    expect(current.humidity).to_not be_nil
    expect(current.icon).to_not be_nil
    expect(current.time).to_not be_nil
    expect(current.visibility).to_not be_nil
  end

  it 'returns an array of houlry weather objects' do
    hourly = ForecastSearch.hourly_weather(@location)

    expect(hourly).to be_an(Array)
    expect(hourly.first).to be_a(HourlyWeather)
    expect(hourly.first.date).to_not be_nil
    expect(hourly.first.hour).to_not be_nil
    expect(hourly.first.icon).to_not be_nil
    expect(hourly.first.temp).to_not be_nil
    expect(hourly.first.time).to_not be_nil
  end

  it 'returns an array of daily weather object' do
    daily = ForecastSearch.daily_weather(@location)

    expect(daily).to be_an(Array)
    expect(daily.first).to be_a(DailyWeather)
    expect(daily.first.date).to_not be_nil
    expect(daily.first.day).to_not be_nil
    expect(daily.first.description).to_not be_nil
    expect(daily.first.feels_like_day).to_not be_nil
    expect(daily.first.high_temp).to_not be_nil
    expect(daily.first.icon).to_not be_nil
    expect(daily.first.low_temp).to_not be_nil
    expect(daily.first.sunrise).to_not be_nil
    expect(daily.first.sunset).to_not be_nil
    expect(daily.first.temp).to_not be_nil
    expect(daily.first.time).to_not be_nil
    expect(daily.first.uvi).to_not be_nil
  end

  it 'returns a forecast object for a location' do
    weather = ForecastSearch.results(@location)

    expect(weather).to be_a(Forecast)
    expect(weather.current).to be_a(CurrentWeather)
    expect(weather.daily.first).to be_a(DailyWeather)
    expect(weather.hourly.first).to be_an(HourlyWeather)
  end
end
