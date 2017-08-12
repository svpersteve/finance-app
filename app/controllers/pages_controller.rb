class PagesController < ApplicationController
  before_action :get_base_data

  def home
    @net_worth = 0
    @accounts.each do |account|
      @net_worth += account.current_balance
    end
  end

  def current_month_graph
    get_daily_balances
  end

  def current_year_graph
    get_monthly_balances
  end

  def current_month
    Time.now.day.times do |index|
      day = (index + 1)
      net_worth_today = 0
      @accounts.each do |account|
        net_worth_today += account.balance_on(Date.new(@year, @month, day) + 1.day)
      end
      @daily_balances << net_worth_today
    end
  end

  def current_year
    Time.now.month.times do |index|
      month = (index + 1)
      net_worth_today = 0
      @accounts.each do |account|
        net_worth_today += account.balance_on(Date.new(@year, month, -1))
      end
      @monthly_balances << net_worth_today
    end
  end

  private

  def get_base_data
    @accounts = Account.all.includes(:balances)
    @current_month = Time.now.strftime("%B")
    @current_year = Time.now.strftime("%Y")
    @month = Time.now.month
    @year = Time.now.year
    @daily_balances = []
    @monthly_balances = []
  end

  def get_daily_balances
    get_days

    Time.now.day.times do |index|
      day = (index + 1)
      net_worth_today = 0
      @accounts.each do |account|
        net_worth_today += account.balance_on(Date.new(@year, @month, day) + 1.day)
      end
      @daily_balances << net_worth_today
    end

    gon.daily_balances = @daily_balances
  end

  def get_monthly_balances
    get_months

    Time.now.month.times do |index|
      month = (index + 1)
      net_worth_today = 0
      @accounts.each do |account|
        net_worth_today += account.balance_on(Date.new(@year, month, -1))
      end
      @monthly_balances << net_worth_today
    end
    gon.monthly_balances = @monthly_balances
  end

  def get_days
    gon.days = []
    Time.now.day.times do |index|
      gon.days << index + 1
    end
  end

  def get_months
    gon.months = []
    Time.now.month.times do |index|
      gon.months << Date::MONTHNAMES[index + 1]
    end
  end
end
