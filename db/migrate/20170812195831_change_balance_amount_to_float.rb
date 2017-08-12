class ChangeBalanceAmountToFloat < ActiveRecord::Migration[5.1]
  def change
    change_column :balances, :amount, :float, null: false, default: 0
  end
end
