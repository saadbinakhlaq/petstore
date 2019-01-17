require 'rails_helper'

RSpec.describe AdoptionRequest, type: :model do
  it { should validate_presence_of(:shelter) }
  it { should validate_presence_of(:pet) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:address) }
end
