class ShelterPolicy < ApplicationPolicy
  def create?
    user.account.admin?
  end
end