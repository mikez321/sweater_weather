require 'rails_helper'

describe 'new user registration' do
  it 'can make a post request to add new users' do
    post '/api/v1/users'

    expect(response).to be_successful
  end
end
