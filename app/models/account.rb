class Account < ActiveRecord::Base
  has_many :balances
end
