require 'pry'
require_relative 'bank_account.rb'
require_relative 'transfer.rb'

b1 = BankAccount.new("Felipe")
b2 = BankAccount.new("Oli")

t1 = Transfer.new(b1, b2, 300)
t2 = Transfer.new(b1, b2, 8000)

binding.pry
0