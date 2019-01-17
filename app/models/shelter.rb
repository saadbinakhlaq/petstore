class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy
  has_many :accounts, dependent: :destroy
  has_many :adoption_request, dependent: :destroy

  validates :name, presence: true
end
