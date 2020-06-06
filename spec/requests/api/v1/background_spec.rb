require 'rails_helper'

describe 'google background image api' do
  it 'can retrieve an image' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
  end
end
