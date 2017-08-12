# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Account.create(name: 'Starling', category: 'short-term')
Account.create(name: 'MBNA', category: 'short-term')
Account.create(name: 'Mortgage', category: 'property')
Account.create(name: 'Flat', category: 'property')
Account.create(name: 'FirstBuy', category: 'property')
Account.create(name: 'Aaron', category: 'short-term')
Account.create(name: 'MoneyBox', category: 'long-term')
Account.create(name: 'Loan One', category: 'long-term')
Account.create(name: 'Loan Two', category: 'long-term')
