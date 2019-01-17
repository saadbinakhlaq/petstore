FactoryBot.define do
  factory :shelter do
    name { Faker::Name.first_name }
    desciption { "MyString" }
    address { Faker::Address.full_address }

    trait :with_pets do
      after(:create) do |shelter, _|
        create_list(:pet, 20, shelter: shelter)
      end
    end
  end
end
