class BalancesController < ApplicationController
  def index
    @starling_balances = Balance.starling.all
  end
end
