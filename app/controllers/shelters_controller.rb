class SheltersController < ApplicationController
  def create
    @shelter = Shelter.new(shelter_params.merge(org_type: 'shelter'))
    authorize @shelter

    if @shelter.valid?
      @shelter.save!
      render :head, status: :created
    else
      render json: {
        errors: @shelter.errors.messages
      }, status: :unprocessable_entity
    end
  end

  def delete
  end

  private

  def shelter_params
    params.require(:shelter).permit(
      :name,
      :address,
      :city,
      :postcode,
      :description
    )
  end
end