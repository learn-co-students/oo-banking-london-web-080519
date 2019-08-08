require_relative "bank_account.rb"
require 'pry'
class Transfer
  # your code here
  attr_reader :sender, :receiver
  attr_accessor  :status, :amount, :balance

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount 
    @status = "pending"
    
  end

  def valid?
    @sender.valid? && @receiver.valid?
    
    # Bank_account.valid?

  end

  def execute_transaction
    if @status != "complete" && @sender.balance > amount && valid?
      @sender.deposit(amount * -1)
      @receiver.deposit(amount)
      @status = "complete" 
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."

    end
    

  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end

end
