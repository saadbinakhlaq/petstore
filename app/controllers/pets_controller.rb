class PetsController < ApplicationController
  before_action :find_shelter, only: :index
  before_action :check_user_access

  def index
    @pets = @shelter.pets

    render json: @pets, root: 'pets', each_serializer: PetSerializer
  end

  def create
    @pet = Pet.new(pet_params)

    render :head, status: :created
  end

  def show
    @pet = Pet.new(
      name: Faker::Creature::Dog.name,
      race: Faker::Creature::Dog.breed,
      image: "http://cdn.com/1",
      medical_condition: "Some condition" 
    )

    render json: @pet
  end

  def set_adoptable
    render :head
  end

  def delist
    render :head
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

  def pet_params
    params.require(:pet).permit(
      :name,
      :image,
      :race,
      :medical_condition
    )
  end
end