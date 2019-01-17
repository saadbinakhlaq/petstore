FactoryBot.define do
  factory :pet do
    name { Faker::Creature::Dog.name }
    medical_condition { "MyText" }
    image_link { "MyString" }
    race { Faker::Creature::Dog.breed }
    shelter { build(:shelter) }
    state { ['unavailable', 'adoption_available', 'adoption_pending'].sample }
  end
end
