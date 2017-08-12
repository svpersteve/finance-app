class CreateBalance < ActiveRecord::Migration[5.1]
  def change
    create_table :balances do |t|
      t.string :account, null: false
      t.integer :amount, null: false

      t.timestamps null: false
    end
  end
end
