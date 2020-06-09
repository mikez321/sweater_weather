require 'rails_helper'

describe 'road trip endpoint' do
  before(:each) do
    params = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }

    post '/api/v1/users', params: params
  end

  it 'returns starting and endpoints and a variety of other info' do
    user = User.find_by(email: 'whatever@example.com')

    user_params = {
      origin: 'Denver, CO',
      destination: 'Pueblo, CO',
      api_key: user.api_key
    }

    post '/api/v1/road_trip', params: user_params

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:data)
    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:type)
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to have_key(:origin)
    expect(json[:data][:attributes]).to have_key(:destination)
    expect(json[:data][:attributes]).to have_key(:travel_time)
    expect(json[:data][:attributes]).to have_key(:arrival_weather)
    expect(json[:data][:attributes][:arrival_weather]).to have_key(:temp)
    expect(json[:data][:attributes][:arrival_weather]).to have_key(:description)

    expect(json[:data][:attributes][:origin]).to eq(user_params[:origin])
    expect(json[:data][:attributes][:destination]).to eq(user_params[:destination])

  end
end
