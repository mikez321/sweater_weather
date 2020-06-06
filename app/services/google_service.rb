class GoogleService
  def self.get_coordinates(city_name)
    response = conn.get('geocode/json') do |conn|
      conn.params[:address] = city_name
    end
    json = JSON.parse(response.body, symbolize_names: true)
    coords = json[:results].first[:geometry][:location]
  end

  def self.get_city_image(city_name)
    
  end

  private

  def self.conn
    Faraday.new('https://maps.googleapis.com/maps/api') do |f|
      f.params[:key] = ENV['GOOGLE_KEY']
    end
  end
end
