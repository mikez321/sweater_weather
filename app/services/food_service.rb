class FoodService
  def initialize(food_params)
    @start_coords = GoogleService.get_coordinates(food_params['start'])
    @dest_coords = GoogleService.get_coordinates(food_params['end'])
    @food_params = food_params
  end

  def food_search
    # Faraday.get('https://developers.zomato.com/api/v2.1/search') do |f|
    #   f.headers['user-key'] = ENV['ZOMATO_KEY']
    #   f.params[:lat] = @dest_coords[:lat]
    #   f.params[:lon] = @dest_coords[:lng]
    #   f.params[:q] = @food_params['search']
    # end
    conn.get('/search') do |conn|
      conn.params[:lat] = @dest_coords[:lat]
      conn.params[:lon] = @dest_coords[:lng]
      conn.params[:q] = @food_params['search']
    end
  end

  private

  def conn
    Faraday.new('https://developers.zomato.com/api/v2.1') do |f|
      f.headers['user-key'] = ENV['ZOMATO_KEY']
    end
  end
end
