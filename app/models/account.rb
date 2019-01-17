class Account < ApplicationRecord
  belongs_to :user
  belongs_to :shelter

  validates :user, presence: true
end
