require 'rails_helper'

describe 'location information' do
  it 'can return the current weather' do

    get '/api/v1/forecast?location=denver,co'

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    require "pry"; binding.pry
  end
end
