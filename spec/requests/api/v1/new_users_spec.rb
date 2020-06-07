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

    post '/api/v1/users', params: {user: params}

    expect(response).to be_successful

    expect(User.count).to eq(2)

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json).to have_key(:data)
    expect(json[:data]).to have_key(:type)
    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes][:email]).to eq("whatever@example.com")
  end
end
