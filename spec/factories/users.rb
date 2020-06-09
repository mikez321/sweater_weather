FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest { Faker::Team.creature }
    api_key { Faker::Crypto.md5 }
  end
end
