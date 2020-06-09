class GoogleService
  def self.get_coordinates(city_name)
    response = conn.get('geocode/json') do |conn|
      conn.params[:address] = city_name
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:results].first[:geometry][:location]
  end

  def self.get_city_image(city_name)
    photo_response = conn.get('place/photo') do |conn|
      conn.params[:maxwidth] = '4000'
      conn.params[:photoreference] = photoreference(city_name)
    end
    photo_response.headers['location']
  end

  def self.photoreference(city_name)
    ref_response = conn.get('place/findplacefromtext/json') do |conn|
      conn.params[:input] = city_name
      conn.params[:inputtype] = 'textquery'
      conn.params[:fields] = 'photos,name'
    end
    json = JSON.parse(ref_response.body, symbolize_names: true)
    json[:candidates].first[:photos].first[:photo_reference]
  end

  def self.get_directions(origin, destination)
    directions_response = conn.get('directions/json') do |conn|
      conn.params[:origin] = origin
      conn.params[:destination] = destination
    end
    json = JSON.parse(directions_response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://maps.googleapis.com/maps/api') do |f|
      f.params[:key] = ENV['GOOGLE_KEY']
    end
  end

  private_class_method :conn
end
