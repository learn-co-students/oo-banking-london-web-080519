# in order to run a pry or anything else, create a separate run file
# use require_relative for all other files you need, plus pry
# set up some test data


require_relative("./bank_account.rb")
require_relative("./transfer.rb")
require "pry"

bank_account1 = BankAccount.new("Ian")
bank_account2 = BankAccount.new("Tegan")
transfer1 = Transfer.new(bank_account1, bank_account2, 500)  
# ^^ passing through objects from the BankAccount Class, that then pull through all the states and behaviours from that Class
# ie you can use methods from the BankAccount Class within the Transfer Class

binding.pry
"start"