class Pet < ApplicationRecord
  belongs_to :shelter

  validates :shelter, presence: true
  validates :name, presence: true
  validates :race, presence: true
end
