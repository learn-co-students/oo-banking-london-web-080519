#require "pry"

class BankAccount
    attr_reader :name
    attr_accessor :balance, :status, :is_valid

   # @@all = []

    def initialize(owner)
        @name = owner
        @balance = 1000
        @status = "open"
       # @@all << self
    end

    def deposit(amount) #just method for the instance, not the class
        @balance += amount #get the instance of @balance
    end

    def display_balance
        "Your balance is $#{self.balance}." #call it on this instance's balance
    end

    def valid?
        # == true if @status == "open"
        # && @balance > 0
        self.status == "open" && self.balance > 0 
    end

    def close_account
        self.status = "closed"
    end

    def self.all
        @@all
    end

end
