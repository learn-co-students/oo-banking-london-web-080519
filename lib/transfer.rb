require 'pry'

class Transfer
  # your code here

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.balance > @amount && self.valid? && @status == "pending"
      @status = "complete"
      @sender.balance -= @amount
      @receiver.balance += @amount
      binding.pry
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @status = "reversed"
      @sender.balance += @amount
      @receiver.balance -= @amount
    end
  end
  

end
