require 'rails_helper'

describe 'road trip endpoint' do
  before(:each) do
    params = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }

      post '/api/v1/users',
      params: params.to_json,
      headers: { 'CONTENT_TYPE' => 'application/json',
                 'Accept': 'application/json' }
  end

  it 'returns starting and endpoints and a variety of other info' do
    user = User.find_by(email: 'whatever@example.com')

    user_params = {
      origin: 'Denver, CO',
      destination: 'Pueblo, CO',
      api_key: user.api_key
    }

    post '/api/v1/road_trip',
    params: user_params.to_json,
    headers: { 'CONTENT_TYPE' => 'application/json',
               'Accept': 'application/json' }

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:data)
    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:type)
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to have_key(:origin)
    expect(json[:data][:attributes]).to have_key(:destination)
    expect(json[:data][:attributes]).to have_key(:travel_time)
    expect(json[:data][:attributes]).to have_key(:arrival_time)
    expect(json[:data][:attributes]).to have_key(:arrival_weather)
    expect(json[:data][:attributes][:arrival_weather]).to have_key(:temp)
    expect(json[:data][:attributes][:arrival_weather]).to have_key(:description)
    expect(json[:data][:attributes][:arrival_weather]).to have_key(:arrival_hour)

    expect(json[:data][:attributes][:origin]).to eq(user_params[:origin])
    expect(json[:data][:attributes][:destination]).to eq(user_params[:destination])
  end

  it 'will not return anything without an API key' do
    user = User.find_by(email: 'whatever@example.com')

    user_params = {
      origin: 'Denver, CO',
      destination: 'Pueblo, CO',
    }

    post '/api/v1/road_trip',
    params: user_params.to_json,
    headers: { 'CONTENT_TYPE' => 'application/json',
               'Accept': 'application/json' }

    expect(response).to_not be_successful

    expect(response.status).to eq(401)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:errors)
    expect(json[:errors].first).to have_key(:status)
    expect(json[:errors].first).to have_key(:source)
    expect(json[:errors].first).to have_key(:detail)

    expect(json[:errors].first[:source]).to eq('unauthorized')
    expect(json[:errors].first[:detail]).to eq('user authentication failed')
  end

  it 'will not return anything with a blank API key' do
    user = User.find_by(email: 'whatever@example.com')

    user_params = {
      origin: 'Denver, CO',
      destination: 'Pueblo, CO',
      api_key: ''
    }

    post '/api/v1/road_trip',
    params: user_params.to_json,
    headers: { 'CONTENT_TYPE' => 'application/json',
               'Accept': 'application/json' }

    expect(response).to_not be_successful

    expect(response.status).to eq(401)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:errors)
    expect(json[:errors].first).to have_key(:status)
    expect(json[:errors].first).to have_key(:source)
    expect(json[:errors].first).to have_key(:detail)

    expect(json[:errors].first[:source]).to eq('unauthorized')
    expect(json[:errors].first[:detail]).to eq('user authentication failed')
  end

  it 'will not return anything with an incorrect API key' do
    user = User.find_by(email: 'whatever@example.com')

    user_params = {
      origin: 'Denver, CO',
      destination: 'Pueblo, CO',
      api_key: 'notanapikey'
    }

    post '/api/v1/road_trip',
    params: user_params.to_json,
    headers: { 'CONTENT_TYPE' => 'application/json',
               'Accept': 'application/json' }

    expect(response).to_not be_successful

    expect(response.status).to eq(401)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:errors)
    expect(json[:errors].first).to have_key(:status)
    expect(json[:errors].first).to have_key(:source)
    expect(json[:errors].first).to have_key(:detail)

    expect(json[:errors].first[:source]).to eq('unauthorized')
    expect(json[:errors].first[:detail]).to eq('user authentication failed')
  end

  it 'will not return anything without an origin' do
    user = User.find_by(email: 'whatever@example.com')

    user_params = {
      origin: '',
      destination: 'Pueblo, CO',
      api_key: user.api_key
    }

    post '/api/v1/road_trip',
    params: user_params.to_json,
    headers: { 'CONTENT_TYPE' => 'application/json',
               'Accept': 'application/json' }

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:errors)
    expect(json[:errors].first).to have_key(:status)
    expect(json[:errors].first).to have_key(:source)
    expect(json[:errors].first).to have_key(:detail)
    expect(json[:errors].first[:detail]).to eq('missing or incorrect parameters')
  end

  it 'will not return anything without a destination' do
    user = User.find_by(email: 'whatever@example.com')

    user_params = {
      origin: 'Denver, CO',
      destination: '',
      api_key: user.api_key
    }

    post '/api/v1/road_trip',
    params: user_params.to_json,
    headers: { 'CONTENT_TYPE' => 'application/json',
               'Accept': 'application/json' }

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:errors)
    expect(json[:errors].first).to have_key(:status)
    expect(json[:errors].first).to have_key(:source)
    expect(json[:errors].first).to have_key(:detail)
    expect(json[:errors].first[:detail]).to eq('missing or incorrect parameters')
  end
end
