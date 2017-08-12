# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

current_account = Account.create(name: 'Current Account', category: 'short-term')
credit_card = Account.create(name: 'Credit Card', category: 'short-term')
mortgage = Account.create(name: 'Mortgage', category: 'property')
apartment = Account.create(name: 'Apartment', category: 'property')
savings = Account.create(name: 'Savings', category: 'long-term')
loan = Account.create(name: 'Loan', category: 'long-term')
student_loan = Account.create(name: 'Student Loan', category: 'long-term')

12.times do |index|
  current_account.balances.create(created_at: index.month.ago, amount: (1000 - (index * 10)) )
  credit_card.balances.create(created_at: index.month.ago, amount: (-1000 - (index * 10)) )
  mortgage.balances.create(created_at: index.month.ago, amount: -200000)
  apartment.balances.create(created_at: index.month.ago, amount: 250000)
  savings.balances.create(created_at: index.month.ago, amount: (5000 - 100) )
  loan.balances.create(created_at: index.month.ago, amount: -10000)
  student_loan.balances.create(created_at: index.month.ago, amount: -30000)
end

mortgage.balances.order('created_at ASC').each_with_index do |balance, index|
  balance.update(amount: balance.amount - (500 * index))
end

loan.balances.order('created_at ASC').each_with_index do |balance, index|
  balance.update(amount: balance.amount + (100 * index))
end

savings.balances.order('created_at ASC').each_with_index do |balance, index|
  balance.update(amount: balance.amount + (100 * index))
end

student_loan.balances.order('created_at ASC').each_with_index do |balance, index|
  balance.update(amount: balance.amount + (100 * index))
end

apartment.balances.order('created_at ASC').each_with_index do |balance, index|
  balance.update(amount: balance.amount + (5000 * index))
end
