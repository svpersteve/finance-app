class Account < ActiveRecord::Base
  has_many :balances

  scope :short_term, -> { where(category: 'short-term').order('position ASC') }
  scope :long_term, -> { where(category: 'long-term').order('position ASC') }
  scope :property, -> { where(category: 'property').order('position ASC') }

  def current_balance
    balances&.last&.amount || 0
  end
end
