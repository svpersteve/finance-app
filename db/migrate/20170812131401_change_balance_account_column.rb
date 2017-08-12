class ChangeBalanceAccountColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :balances, :account
    add_reference :balances, :account, index: true, null: false, default: 0
  end
end
