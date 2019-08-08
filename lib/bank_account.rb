require "pry"
class BankAccount
    attr_reader :name 
    attr_accessor :balance, :status

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end
    

    # deposit(deposit)
    # @balance += deposit
    def deposit(deposit)
        self.balance += deposit
        self.balance
        
    end

    def display_balance
        return "Your balance is $#{self.balance}."
    end

    # valid?
    # balance > 0
    # status == "open"
    def valid?
        # binding.pry
        @status == "open" && @balance > 0 
        
    end

    def close_account
        @status = "closed"
    end







end
