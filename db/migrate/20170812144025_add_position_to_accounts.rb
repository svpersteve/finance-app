class AddPositionToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :position, :integer
  end
end
