class AddCityAndPostCodeToShelter < ActiveRecord::Migration[5.2]
  def change
    add_column :shelters, :city, :string
    add_column :shelters, :postcode, :string
  end
end
