class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.string :account_type
      t.belongs_to :user, foreign_key: true
      t.belongs_to :shelter, foreign_key: true

      t.timestamps
    end
  end
end
