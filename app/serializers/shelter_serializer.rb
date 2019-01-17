class ShelterSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :address, :city, :postcode
end