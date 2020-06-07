class BackgroundSearch
  def self.results(city_name)
    image_url = GoogleService.get_city_image(city_name)
    Background.new(image_url)
  end
end
