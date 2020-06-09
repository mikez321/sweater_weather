require 'rails_helper'

describe 'user logs in' do
  before(:each) do

    params = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }

    post '/api/v1/users',
    params: params.to_json,
    headers: { 'Content-Type': 'application/json',
               'Accept': 'application/json'}
  end

  it 'can process a successful login' do

    login_params = {
      email: 'whatever@example.com',
      password: 'password'
    }

    post '/api/v1/sessions',
    params: login_params.to_json,
    headers: { 'CONTENT_TYPE' => 'application/json',
               'Accept': 'application/json' }

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

  it 'cant log in if it is not a registered user' do

    login_params = {
      email: 'unregistered@example.com',
      password: 'password'
    }

    post '/api/v1/sessions',
    params: login_params.to_json,
    headers: { 'CONTENT_TYPE' => 'application/json',
               'Accept': 'application/json' }

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:errors)
    expect(json[:errors].first).to have_key(:status)
    expect(json[:errors].first).to have_key(:source)
    expect(json[:errors].first).to have_key(:detail)
    expect(json[:errors].first[:status]).to eq(400)
    expect(json[:errors].first[:detail]).to eq('no user found with provided credentials')
  end

  it 'cant log in with an incorrect password' do
    login_params = {
      email: 'whatever@example.com',
      password: 'wrongpassword'
    }

    post '/api/v1/sessions',
    params: login_params.to_json,
    headers: { 'CONTENT_TYPE' => 'application/json',
               'Accept': 'application/json' }

    expect(response).to_not be_successful
    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:errors)
    expect(json[:errors].first).to have_key(:status)
    expect(json[:errors].first).to have_key(:source)
    expect(json[:errors].first).to have_key(:detail)
    expect(json[:errors].first[:status]).to eq(400)
    expect(json[:errors].first[:detail]).to eq('user authentication failed')
  end
end
