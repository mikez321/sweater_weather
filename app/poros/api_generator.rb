class ApiGenerator
  def self.generate(user)
    combo = user.email + user.id.to_s + Time.now.in_time_zone.strftime('%H%M%S')
    Digest::MD5.hexdigest combo
  end
end
