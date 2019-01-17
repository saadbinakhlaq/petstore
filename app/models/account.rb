class Account < ApplicationRecord
  belongs_to :user
  belongs_to :shelter

  validates :user, presence: true

  def admin?
    account_type == 'admin'
  end
end
