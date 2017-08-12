class AddMonthlyPaymentToAccounts < ActiveRecord::Migration[5.1]
  def change
    add_column :accounts, :monthly_payment, :float, default: 0
  end
end
