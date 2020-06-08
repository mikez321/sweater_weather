require 'rails_helper'

describe 'foodie endpoint' do
  it 'can return info about a place, food, and the weather' do

    food_params = {
      start: 'denver,co',
      end: 'pueblo,co',
      search: 'italian'
    }

    get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian', params: food_params

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
  end
end
