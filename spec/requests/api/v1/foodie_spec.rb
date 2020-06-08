require 'rails_helper'

describe 'foodie endpoint' do
  it 'can return info about a place, food, and the weather' do

    get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'

    expect(response).to be_successful

    #

  end
end
