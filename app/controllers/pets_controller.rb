class PetsController < ApplicationController
  before_action :find_shelter
  before_action :check_user_access

  def index
    @pets = @shelter.pets

    render json: @pets, root: 'pets', each_serializer: PetSerializer
  end

  def create
    @pet = Pet.new(pet_params.merge(id: 1))

    render json: @pet, root: 'pet', status: :created
  end

  def set_adoptable
    @pet = Pet.new(
      id: 1,
      image_link: 'http://link.com/1',
      state: 'unavailable',
      name: 'Milo',
      race: 'cat',
      medical_condition: 'good health',
      state: 'adoption_available'
    )

    render json: @pet, root: 'pet'
  end

  def delist
    @pet = Pet.new(
      id: 1,
      image_link: 'http://link.com/1',
      state: 'unavailable',
      name: 'Milo',
      race: 'cat',
      medical_condition: 'good health',
      state: 'unavailable'
    )

    render json: @pet, root: 'pet'
  end

  def show
    @pet = Pet.new(
      id: 1,
      name: Faker::Creature::Dog.name,
      race: Faker::Creature::Dog.breed,
      image_link: "http://cdn.com/1",
      medical_condition: "Some condition",
      state: 'adoption_available'
    )

    render json: @pet, root: 'pet'
  end

  private

  def find_shelter
    @shelter = Shelter.find(params[:shelter_id])
  end

  def check_user_access
    raise Pundit::NotAuthorizedError unless authorized_user
  end

  def authorized_user
    current_user.account.account_type == 'admin' ||
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