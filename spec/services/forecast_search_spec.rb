require 'rails_helper'

describe 'forecast searching' do
  it 'returns a forecast object for a location' do

    location = 'Denver,CO'

    weather = ForecastSearch.results(location)
    
    expect(weather).to be_a(Forecast)
  end
end
