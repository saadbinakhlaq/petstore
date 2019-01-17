FactoryBot.define do
  factory :shelter do
    name { Faker::Name.first_name }
    description { "MyString" }
    address { Faker::Address.full_address }
    org_type { 'shelter' }

    trait :with_pets do
      after(:create) do |shelter, _|
        create_list(:pet, 20, shelter: shelter)
      end
    end

    trait :admin do
      org_type { 'admin' }
    end
  end
end
