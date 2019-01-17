class CreateAdoptionRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :adoption_requests do |t|
      t.belongs_to :pet, foreign_key: true
      t.string :name
      t.string :email
      t.string :address
      t.string :city
      t.string :postcode
      t.string :phone_number
      t.belongs_to :shelter, foreign_key: true

      t.timestamps
    end
  end
end
