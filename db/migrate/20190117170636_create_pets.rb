class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name
      t.text :medical_condition
      t.string :image_link
      t.string :race
      t.belongs_to :shelter, foreign_key: true
      t.string :state, default: 'unavailable'

      t.timestamps
    end
  end
end
