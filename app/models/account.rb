class Account < ActiveRecord::Base
  has_many :balances

  scope :short_term, -> { where(category: 'short-term') }
  scope :long_term, -> { where(category: 'long-term') }
  scope :property, -> { where(category: 'property') }

  def current_balance
    balances&.last&.amount || 0
  end
end
