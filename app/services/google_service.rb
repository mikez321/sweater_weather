class GoogleService
  def self.get_coordinates(city_name)
    response = conn.get('geocode/json') do |conn|
      conn.params[:address] = city_name
    end
    json = JSON.parse(response.body, symbolize_names: true)
    coords = json[:results].first[:geometry][:location]
  end

  def self.get_city_image(city_name)
    ref_response = conn.get('place/findplacefromtext/json') do |conn|
      conn.params[:input] = city_name
      conn.params[:inputtype] = 'textquery'
      conn.params[:fields] = 'photos,formatted_address,name,rating,opening_hours,geometry'
    end
    json = JSON.parse(ref_response.body, symbolize_names: true)
    photo_reference = json[:candidates].first[:photos].first[:photo_reference]

    photo_response = conn.get('place/photo') do |conn|
      conn.params[:maxwidth] = '4000'
      conn.params[:photoreference] = 'CmRaAAAAjSMDnUAwEOVf9Ds3jM5OrYCYl_gRGICDVhgVD-zhCTMDaqH-M6v3jF0DgU4bCbYLjsAyCL8fDD0oI1-PI0QBH_kr3co4U09n4tJ4Qew7ZlSCHRCBvR_WweJ_WzxXlwdtEhCKj7t10reeQgQfQLmOwqFcGhSWpo1ztPpiqnE8Wy0KHFIzCbp2TQ'
    end
    require "pry"; binding.pry
    json = JSON.parse(photo_response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new('https://maps.googleapis.com/maps/api') do |f|
      f.params[:key] = ENV['GOOGLE_KEY']
    end
  end
end
