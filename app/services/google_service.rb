class GoogleService
  def self.get_coordinates(location)
    response = Faraday.get('https://maps.googleapis.com/maps/api/geocode/json') do |f|
      f.params[:address] = location
      f.params[:key] = ENV['GOOGLE_KEY']
    end
    json = JSON.parse(response.body, symbolize_names: true)
    coords = json[:results].first[:geometry][:location]
  end
end
