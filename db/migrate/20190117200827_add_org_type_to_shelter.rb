class AddOrgTypeToShelter < ActiveRecord::Migration[5.2]
  def change
    add_column :shelters, :org_type, :string, default: 'shelter'
  end
end
