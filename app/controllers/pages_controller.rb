class PagesController < ApplicationController
  def home
    @unit = '£'
    request = RestClient.get "https://api.starlingbank.com/api/v1/accounts/balance", { authorization: "Bearer #{ENV['STEVE_TOKEN']}" }
    @balance = ActiveSupport::JSON.decode(request)

    @balances = [
      'Starling' => @balance['effectiveBalance'],
      'MBNA'     => -2669,
      'Moneybox' => 38,
      'Aaron'    => 237
    ]

    @total_cash = 0
    @balances.each do |balance|
      balance.each do |name, value|
        @total_cash += value
      end
    end

    @loan1 = -25500
    @loan2 = -19592

    @loans_total = @loan1 + @loan2

    @mortgage = -116000
    @flat = 290000
    @firstbuy = @flat * -0.20

    @assets = (@mortgage + @flat + @firstbuy)

    @total_worth = @assets + @total_cash + @loans_total
  end
end
