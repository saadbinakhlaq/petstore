class ChangeColumnDesciptionToDescriptionShelter < ActiveRecord::Migration[5.2]
  def change
    rename_column :shelters, :desciption, :description
  end
end
