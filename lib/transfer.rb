
#----------------------------------------------------


#require “pry”
#require_relative “bank_account.rb”
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status
  #create a transfer class which initiate a sender, a receiver, a status to pending, a transfer amount as accessors
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  #create a “valid?” which returns the value of BankAccount.valid? for sender and receiver
  def valid?
    sender.valid? && receiver.valid? && sender.balance >= amount
  end
  #create an instance method “execute_transaction” which runs
  #if status isn’t ‘complete’ && BankAccount.valid? is true
  #   then deposit with minus value for the
  #   sender account and runs deposit for the receiver and change the status to ‘complete’
  #else status changed to “rejected”
  def execute_transaction
    if @status != "complete" && valid?
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  # create an instance method ‘reverse_transfer’
  # if status == completed
  # deposit with positive value for the
  # sender account and runs negative deposit for the receiver and change the status to ‘reversed’
  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end
 end
 #aude = BankAccount.new(“Aude”)
 #aude.status = “closed”
 #chris = BankAccount.new(“Chris”)
 #transfer_example = Transfer.new(aude, chris, 50)
 #transfer_example.status = “complete”
 #binding.pry
 #0