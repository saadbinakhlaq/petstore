class AdoptionRequest < ApplicationRecord
  belongs_to :pet
  belongs_to :shelter

  validates :pet, presence: true
  validates :shelter, presence: true
  validates :name, presence: true
  validates :email, presence: true
  validates :address, presence: true
end
