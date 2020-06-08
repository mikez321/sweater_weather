require 'rails_helper'

describe 'foodie endpoint' do
  it 'can return info about a place, food, and the weather' do

    food_params = {
      start: 'denver,co',
      end: 'pueblo,co',
      search: 'italian'
    }

    get '/api/v1/foodie', params: food_params

    expect(response).to be_successful

    json = JSON.parse(response.body, symbolize_names: true)
    expect(json).to have_key(:data)
    expect(json[:data]).to have_key(:id)
    expect(json[:data]).to have_key(:type)
    expect(json[:data]).to have_key(:attributes)
    expect(json[:data][:attributes][:restaurant]).to have_key(:name)
    expect(json[:data][:attributes][:restaurant]).to have_key(:location)
    # expect(json[:data][:attributes]).to have_key(:end_location)
    # expect(json[:data][:attributes]).to have_key(:travel_time)
    # expect(json[:data][:attributes]).to have_key(:forecast)
    # expect(json[:data][:attributes]).to have_key(:restaurant)
    # expect(json[:data][:attributes][:forecast]).to have_key(:summary)
    # expect(json[:data][:attributes][:forecast]).to have_key(:temperature)

#     {
#   "data": {
#     "id": "null",
#     "type": "foodie",
#     "attributes": {
#       "end_location": "pueblo,co",
#       "travel_time": "1 hours 48 min",
#       "forecast": {
#         "summary": "Cloudy with a chance of meatballs",
#         "temperature": "83"
#       },
#       "restaurant": {
#         "name": "Angelo's Pizza Parlor",
#         "address": "105 E Riverwalk, Pueblo 81003"
#       }
#     }
#   }
# }

  end
end
