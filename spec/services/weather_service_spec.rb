require 'rails_helper'

describe 'weather api' do
  it 'can get the weather of a location' do

    location = 'Denver,CO'

    weather = ForecastSearch.results(location)

    expect(weather).to be_a(Hash)
  end
end
