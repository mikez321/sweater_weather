require 'rails_helper'

describe 'google_service' do
  it 'can convert a city into lat and lon coordinates' do
    city = 'Denver, CO'

    coordinates = GoogleService.get_coordinates(city)

    expect(coordinates).to be_a(Hash)
    expect(coordinates).to have_key(:lat)
    expect(coordinates).to have_key(:lng)
  end
end
