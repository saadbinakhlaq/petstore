require 'rails_helper'

RSpec.describe Pet, type: :model do
  it { should validate_presence_of(:shelter) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:race) }
end
