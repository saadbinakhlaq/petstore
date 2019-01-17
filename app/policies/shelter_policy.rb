class ShelterPolicy < ApplicationPolicy
  def create?
    user.account.admin?
  end

  def destroy?
    user.account.admin?
  end
end