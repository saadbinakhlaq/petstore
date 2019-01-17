FactoryBot.define do
  factory :account do
    account_type { 'shelter' }
    user { nil }
    shelter { nil }
  end
end
