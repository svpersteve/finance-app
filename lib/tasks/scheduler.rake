desc "This task is called by the Heroku scheduler add-on"
task :update_balances => :environment do
  day_of_month = Time.now.strftime("%d")
  day_of_week = Time.now.strftime("%A")

  # Starling
  starling = Account.find_by(name: 'Starling')
  request = RestClient.get "https://api.starlingbank.com/api/v1/accounts/balance", { authorization: "Bearer #{ENV['STEVE_TOKEN']}" }
  balance = ActiveSupport::JSON.decode(request)
  Balance.create(account: starling, amount: balance['effectiveBalance'])

  if day_of_month == 28
    # Loan One
    puts 'Updating loan one balance'
    loan_one = Account.find_by(name: 'Loan One')
    Balance.create(account: loan_one, amount: (loan_one.current_balance + loan_one.monthly_payment))

    # Loan Two
    puts 'Updating loan two balance'
    loan_two = Account.find_by(name: 'Loan Two')
    annual_interest = (loan_two.current_balance * loan_two.interest_rate)
    monthly_interest = (annual_interest / 12)
    Balance.create(account: loan_two, amount: (loan_two.current_balance + loan_two.monthly_payment - monthly_interest ))

    # Student loans
    puts 'Updating student loans balance'
    student_loan_one = Account.find_by(name: 'Student Loan One')
    student_loan_two = Account.find_by(name: 'Student Loan Two')
    student_loan_one_interest = (student_loan_one_annual_interest.current_balance * student_loan_one_annual_interest.interest_rate) / 12
    student_loan_two_interest = (student_loan_two_annual_interest.current_balance * student_loan_two_annual_interest.interest_rate) / 12

    Balance.create(account: student_loan_one, amount: (student_loan_one.current_balance - student_loan_one_interest + student_loan_one.monthly_payment))
    Balance.create(account: student_loan_two, amount: (student_loan_two.current_balance - student_loan_two_interest + student_loan_two.monthly_payment))

    # Mortgage
    puts 'Updating mortgage balance'
    mortgage = Account.find_by(name: 'Mortgage')
    mortgage_interest = (mortgage.current_balance * mortgage.interest_rate) / 12
    Balance.create(account: mortgage, amount: (mortgage.current_balance + mortgage.monthly_payment - mortgage_interest ))
  end

  if day_of_week == 'Wednesday'
    puts 'Updating MoneyBox balance'
    moneybox = Account.find_by(name: 'MoneyBox')
    Balance.create(account: moneybox, amount: (moneybox.current_balance + 25 ))
  end

  # FirstBuy
  firstbuy = Account.find_by(name: 'FirstBuy')
  flat = Account.find_by(name: 'Flat')
  unless firstbuy.current_balance == (flat.current_balance * -0.20)
    puts 'Updating FirstBuy balance'
    Balance.create(account: firstbuy, amount: (flat.current_balance * -0.20))
  end
end
