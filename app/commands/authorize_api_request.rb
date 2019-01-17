class AuthorizeApiRequest
  prepend SimpleCommand
  attr_reader :headers

  def initialize(headers = {})
    @headers = headers
  end

  def call
    User.find(headers['Authorization'])
  rescue ActiveRecord::RecordNotFound
    @user || errors.add(:token, 'Invalid credentials') && nil
  end
end