class Balance < ActiveRecord::Base
  scope :starling, -> { where(account: 'starling') }
end
