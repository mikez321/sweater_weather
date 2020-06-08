require 'rails_helper'

describe 'user logs in' do
  before(:each) do

    params = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }

    post '/api/v1/users', params: params
  end

  it 'can process a successful login' do

    login_params = {
      email: 'whatever@example.com',
      password: 'password'
    }

    post '/api/v1/sessions', params: login_params

    expect(response).to be_successful

    expect(response.status).to eq(200)

    json = JSON.parse(response.body, symbolize_names: true)

    user = User.find_by(email: login_params[:email])

    expect(json).to have_key(:data)
    expect(json[:data]).to have_key(:type)
    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes]).to have_key(:email)
    expect(json[:data][:attributes]).to have_key(:api_key)
    expect(json[:data][:attributes][:email]).to eq(user.email)
    expect(json[:data][:attributes][:api_key]).to eq(user.api_key)
  end
end
