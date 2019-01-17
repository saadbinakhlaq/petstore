class PetsController < ApplicationController
  before_action :find_shelter, only: :index
  before_action :check_user_access

  def index
    @pets = @shelter.pets

    render json: @pets, root: 'pets', each_serializer: PetSerializer
  end

  private

  def find_shelter
    @shelter = Shelter.find(params[:shelter_id])
  end

  def check_user_access
    raise Pundit::NotAuthorizedError unless authorized_user
  end

  def authorized_user
    current_user.account.account_type == 'admin'||
    current_user.account.shelter.id == @shelter.id
  end
end