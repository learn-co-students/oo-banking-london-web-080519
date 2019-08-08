#require "pry"

class BankAccount
    #set up a bank class with account holder reader name, accessor balance of 1000, accessor status of open

    attr_reader :name
    attr_accessor :balance, :status

    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self
    end

    #create an getter instance method "deposit" which takes an amount as an argument and increments the balance

    def deposit(amount)
        @balance += amount
    end

    #create a getter instance method "display balance" which returns the balance

    def display_balance
        "Your balance is $#{@balance}."
    end

    #create a instance method "valid?" which checks if the account's balance is > 0 and status = open

    def valid?
        @balance > 0 && @status == "open"
    end

    #create an instance method which changes the status to close
    def close_account
        @status = "closed"
    end

    def self.all
        @@all
    end
end

#aude = BankAccount.new("Aude")
#chris = BankAccount.new("Chris")
#aude.status = "closed"

#binding.pry
#0