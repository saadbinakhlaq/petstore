class User < ApplicationRecord
  has_one :account

  validates :email, 'valid_email_2/email' => true, presence: true, uniqueness: true
  validates :password_digest, presence: true, length: { minimum: 6 }
end
