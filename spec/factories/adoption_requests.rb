FactoryBot.define do
  factory :adoption_request do
    pet { nil }
    name { "MyString" }
    email { "MyString" }
    address { "MyString" }
    city { "MyString" }
    postcode { "MyString" }
    phone_number { "MyString" }
    shelter { nil }
  end
end
