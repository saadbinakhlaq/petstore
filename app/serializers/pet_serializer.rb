class PetSerializer < ActiveModel::Serializer
  attributes :id, :image_link, :state, :name, :race
end