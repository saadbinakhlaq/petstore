class AddStateToAdoptionRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :adoption_requests, :state, :string, default: 'pending'
  end
end
