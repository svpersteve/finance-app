class PagesController < ApplicationController
  def current_month
    @accounts = Account.all.includes(:balances)
    @month = Time.now.month
    @year = Time.now.year
    @month_name = Time.now.strftime("%B")
    @balances = []

    Time.now.day.times do |index|
      day = (index + 1)
      net_worth_today = 0
      @accounts.each do |account|
        net_worth_today += account.balance_on(Date.new(@year, @month, day) + 1.day)
      end
      @balances << net_worth_today
    end
  end
end
