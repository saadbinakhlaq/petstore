class Shelter < ApplicationRecord
  has_many :pets, dependent: :destroy

  validates :name, presence: true
end
