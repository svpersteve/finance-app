class Balance < ActiveRecord::Base
  belongs_to :account, dependent: :destroy

  scope :in_date_order, -> { order('created_at ASC') }

  scope :created_before, ->(date) do
    where('balances.created_at <= ?', date)
  end
end
