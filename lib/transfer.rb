require "pry"

require_relative "bank_account.rb"

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  @@all = []

  def all
    @@all
  end

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end


  def valid?
    #get to each bank account
    #BankAccount.all.select {|account| account.status == "open"}
    # BankAccount.all.select {|account| account.name == self}

    @sender.valid? && @receiver.valid?

    #BankAccount.all.select {|account| account.valid? }
    #if each of our instances.valid? == true
    #then the transfer.valid? == true

  end

  def execute_transaction
    #amount from sender to receiver
    ## subtract amount from sender's balance
    ## add amount to receiver's balance

    if valid? && @status == "pending" && @sender.balance > @amount 
        #run .valid? on transfer on our @sender (in transfer)
          self.sender.balance -= @amount  #in bank_account. 
          self.receiver.balance += @amount
          @status = "complete"
          @@all << self
      else  
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
  end

  def reverse_transfer
    #reverse transfer between two accounts
    #can only reverse executed transfers

    if status == "complete"
      self.sender.balance += @amount
      self.receiver.balance -= @amount
      @status = "reversed"
    end
  end

  
end
# user2 = BankAccount.new("erin")
# user1 = BankAccount.new("will")

# binding.pry
# 0