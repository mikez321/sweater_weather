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
    expect(json[:data][:attributes][:current]).to have_key(:date)
    expect(json[:data][:attributes][:current]).to have_key(:time)
    expect(json[:data][:attributes][:current]).to have_key(:conditions)
    expect(json[:data][:attributes][:current]).to have_key(:icon)
    expect(json[:data][:attributes][:current]).to have_key(:current_temp)
    expect(json[:data][:attributes][:current]).to have_key(:feels_like)
    expect(json[:data][:attributes][:current]).to have_key(:humidity)
    expect(json[:data][:attributes][:current]).to have_key(:visibility)
    expect(json[:data][:attributes][:daily].first).to have_key(:date)
    expect(json[:data][:attributes][:daily].first).to have_key(:time)
    expect(json[:data][:attributes][:daily].first).to have_key(:day)
    expect(json[:data][:attributes][:daily].first).to have_key(:icon)
    expect(json[:data][:attributes][:daily].first).to have_key(:description)
    expect(json[:data][:attributes][:daily].first).to have_key(:rain)
    expect(json[:data][:attributes][:daily].first).to have_key(:temp)
    expect(json[:data][:attributes][:daily].first).to have_key(:high_temp)
    expect(json[:data][:attributes][:daily].first).to have_key(:low_temp)
    expect(json[:data][:attributes][:daily].first).to have_key(:feels_like_day)
    expect(json[:data][:attributes][:daily].first).to have_key(:sunrise)
    expect(json[:data][:attributes][:daily].first).to have_key(:sunset)
    expect(json[:data][:attributes][:daily].first).to have_key(:uvi)
    expect(json[:data][:attributes][:hourly].first).to have_key(:date)
    expect(json[:data][:attributes][:hourly].first).to have_key(:time)
    expect(json[:data][:attributes][:hourly].first).to have_key(:hour)
    expect(json[:data][:attributes][:hourly].first).to have_key(:icon)
    expect(json[:data][:attributes][:hourly].first).to have_key(:temp)
    expect(json[:data][:attributes][:hourly].first).to have_key(:description)


    expect(json[:data][:type]).to eq('forecast')
    expect(json[:data][:attributes][:city_name]).to eq('denver,co')
  end
end
