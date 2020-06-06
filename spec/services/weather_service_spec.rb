require 'rails_helper'

describe 'weather api' do
  it 'can get the weather of a location' do

    location = 'denver,co'

    weather = WeatherService.report(location)

    expect(weather).to be_a(CurrentWeather)
  end
end
