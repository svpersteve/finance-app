class AccountsController < ApplicationController
  def index
    @accounts = Account.all
  end

  def show
    @account = Account.find(params[:id])
    get_chart_data
  end

  private

  def get_chart_data
    @dates = []
    @balances = []

    @account.balances.in_date_order.each do |balance|
      @dates << balance.created_at.to_date.to_formatted_s(:long_ordinal)
      @balances << balance.amount
    end

    gon.dates = @dates
    gon.balances = @balances
  end
end
