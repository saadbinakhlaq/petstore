class SheltersController < ApplicationController
  def create
    @shelter = Shelter.new(shelter_params.merge(org_type: 'shelter'))
    authorize @shelter

    if @shelter.valid?
      @shelter.save!
      render json: @shelter, root: 'shelter', status: :created
    else
      render json: {
        errors: @shelter.errors.messages
      }, status: :unprocessable_entity
    end
  end

  def destroy
    render :head, status: :ok
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