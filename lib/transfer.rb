#require 'pry'
#require_relative 'bank_account.rb'

class Transfer

@@all = []

attr_accessor :transfer, :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
    @@all << self
  end

def valid?
    @sender.valid? && @receiver.valid?
end

def execute_transaction
  if  valid? && @status == "pending" && sender.balance >= @amount
      self.sender.balance -= @amount
      self.receiver.balance += @amount
      @status = "complete"
  else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
  if @status == "complete"
  sender.balance += @amount
  receiver.balance -= @amount
  @status = "reversed"
end
end

def self.all
  @@all
end

end

#user1 = BankAccount.new(user1)
#user2 = BankAccount.new(user2)

#binding.pry
#0
