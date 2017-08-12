class AddInterestRateToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :interest_rate, :float
  end
end
