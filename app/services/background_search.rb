class BackgroundSearch
  def self.results(city_name)
    GoogleService.get_city_image(city_name)
  end
end
