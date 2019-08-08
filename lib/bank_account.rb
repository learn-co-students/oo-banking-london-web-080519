class BankAccount

    attr_reader :name
    attr_accessor :balance, :status

    def initialize (name)
        @name = name
        @balance = 1000
        @status = "open"
    end

#setup instances
#account holder name can't be changed
#balance of '1000'
#status 'open'

#create instance method to deposit, increase balance variable and takes on arument of amount, setter

    def deposit(amount)
        @balance += amount
    end


#display_balnce getter of balane variable

    def display_balance
       "Your balance is $#{@balance}."
    end

#valid? - instance method to check sataus = open and balance is greater than 0

    def valid?
        @balance > 0 && @status == "open"
    end

#close_account create and instnace method what changes @status to "closed" 

    def close_account
        @status = "closed"
    end


end


