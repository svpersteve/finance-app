class Account < ActiveRecord::Base
  has_many :balances

  scope :short_term, -> { where(category: 'short-term').order('position ASC') }
  scope :long_term, -> { where(category: 'long-term').order('position ASC') }
  scope :property, -> { where(category: 'property').order('position ASC') }

  def current_balance
    if name == 'Starling'
      request = RestClient.get "https://api.starlingbank.com/api/v1/accounts/balance", { authorization: "Bearer #{ENV['STEVE_TOKEN']}" }
      balance = ActiveSupport::JSON.decode(request)
      balance['effectiveBalance']
    else
      balances&.in_date_order.last&.amount || 0
    end
  end

  def balance_on(date)
    balances&.in_date_order.created_before(date).last&.amount || 0
  end
end
