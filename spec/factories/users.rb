FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest { Faker::Team.creature }
  end
end
