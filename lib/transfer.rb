class Transfer
  # your code here
  attr_accessor :amount, :status, :receiver, :sender
  def initialize (sender, receiver, amount)
      @receiver = receiver
      @sender = sender
      @status = "pending"
      @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status == "pending" && valid? && @amount < @sender.balance
        @sender.balance -= @amount
     @receiver.balance += @amount
     @status = "complete"
    else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
    @receiver.balance -= @amount
    @status = "reversed"
    end
  end 

end
