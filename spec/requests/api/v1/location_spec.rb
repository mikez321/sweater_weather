require 'rails_helper'

describe 'location information' do
  it 'can return the current weather' do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true )

    expect(json).to be_a(Hash)
    expect(json).to have_key(:data)
    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:type)
    expect(json[:data][:type]).to eq('forecast')
    expect(json[:data][:attributes]).to have_key(:city_name)
    expect(json[:data][:attributes]).to have_key(:current)
    expect(json[:data][:attributes]).to have_key(:daily)
    expect(json[:data][:attributes]).to have_key(:hourly)
  end
end
