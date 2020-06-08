require 'rails_helper'

describe 'user logs in' do
  it 'can process a successful login' do
    user = create(:user)

    post '/api/v1/sessions'

    expect(response).to be_successful
    
  end
end
