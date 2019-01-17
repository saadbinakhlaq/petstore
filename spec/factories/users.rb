FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest { "123456" }
  end
end
