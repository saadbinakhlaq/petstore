class Pet < ApplicationRecord
  belongs_to :shelter
  has_one :adoption_request, dependent: :destroy

  validates :shelter, presence: true
  validates :name, presence: true
  validates :race, presence: true
end
