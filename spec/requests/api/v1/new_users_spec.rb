require 'rails_helper'

describe 'new user registration' do
  it 'can make a post request to add new users' do
    create(:user)

    expect(User.count).to eq(1)

    params = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
      }

    post '/api/v1/users', params: params

    expect(response).to be_successful

    expect(User.count).to eq(2)

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json).to have_key(:data)
    expect(json[:data]).to have_key(:type)
    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes][:email]).to eq("whatever@example.com")
    expect(json[:data][:attributes]).to have_key(:api_key)
    expect(json[:data][:attributes][:api_key]).to_not be_nil
  end

  it 'will not let a user use an already registered email' do
    user1 = User.create!(email: 'mefirst@firstplace.com',
                         password: 'winner',
                         password_confirmation: 'winner')

    params = {
        "email": "mefirst@firstplace.com",
        "password": "password",
        "password_confirmation": "password"
      }

    post '/api/v1/users', params: params

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:errors)
    expect(json[:errors].first).to have_key(:status)
    expect(json[:errors].first).to have_key(:source)
    expect(json[:errors].first).to have_key(:title)
    expect(json[:errors].first).to have_key(:detail)
    expect(json[:errors].first[:status]).to eq('400')
    expect(json[:errors].first[:detail]).to eq('Email has already been taken')
  end

  it 'will not create a user if pw and pw conf are mismatched' do
    params = {
        "email": "mefirst@firstplace.com",
        "password": "password",
        "password_confirmation": "drowssap"
      }

    post '/api/v1/users', params: params

    expect(response).to be_successful
    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:errors)
    expect(json[:errors].first).to have_key(:status)
    expect(json[:errors].first).to have_key(:source)
    expect(json[:errors].first).to have_key(:title)
    expect(json[:errors].first).to have_key(:detail)
    expect(json[:errors].first[:status]).to eq('400')
    expect(json[:errors].first[:detail]).to eq("Password confirmation doesn't match Password")
  end
end
