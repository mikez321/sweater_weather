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

  end
end
