class FoodService
  def initialize(food_params)
    @dest_coords = GoogleService.get_coordinates(food_params['end'])
    @food_params = food_params
  end

  def restaurant_search
    response = conn.get('search') do |conn|
      conn.params[:lat] = @dest_coords[:lat]
      conn.params[:lon] = @dest_coords[:lng]
      conn.params[:q] = @food_params['search']
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:restaurants].first
  end

  private

  def conn
    Faraday.new('https://developers.zomato.com/api/v2.1') do |f|
      f.headers['user-key'] = ENV['ZOMATO_KEY']
    end
  end
end
