require_relative "bank_account.rb"


class Transfer
  # your code here	attr_reader :name
attr_accessor :balance, :sender, :receiver, :status, :amount 

 def initialize(sender,receiver,amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
end 

 def valid?
  sender.valid? &&
  receiver.valid? 
end	

 def execute_transaction
  if @status != "complete" && valid? && sender.balance > amount
    sender.deposit (amount * -1 )
    receiver.deposit (amount)
    @status = "complete"
  else 
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end 
end 

 def reverse_transfer
    if @status == "complete"
      @sender.deposit( @amount ) 
      @receiver.deposit( @amount * -1)
      @status = "reversed"
    end
  end 

end


 

