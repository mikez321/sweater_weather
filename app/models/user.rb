class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_secure_password

  def create_api_key
    key = ApiGenerator.generate(self)
    update(api_key: key)
  end
end
