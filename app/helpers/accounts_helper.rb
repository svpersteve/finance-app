module AccountsHelper
  def total_current_balance(accounts)
    total = 0
    accounts.each do |account|
      total += account.current_balance
    end

    total
  end
end
