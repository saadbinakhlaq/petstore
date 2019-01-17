require 'rails_helper'

RSpec.describe Shelter, type: :model do
  it { should validate_presence_of(:name) }
end
