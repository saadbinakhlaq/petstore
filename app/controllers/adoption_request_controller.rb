class AdoptionRequestController < ApplicationController
  def show
    @adoption_request = AdoptionRequest.new(
      name: "Roy",
      email: Faker::Internet.email,
      phone_number: Faker::PhoneNumber.phone_number,
      address: Faker::Address.full_address,
      city: Faker::Address.city,
      postcode: Faker::Address.zipcode,
      state: 'pending'
    )

    render json: @adoption_request, root: 'adoption_request'
  end

  def destroy
    render :head
  end
end