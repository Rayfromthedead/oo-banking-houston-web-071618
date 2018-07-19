require_relative 'transfer'

class BankAccount

  @@accounts = []

  attr_reader :name
  attr_accessor :balance, :status

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
    @@accounts << self

  end

  def deposit(amount)
    self.balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    self.balance > 0 && self.status == "open"
  end

  def close_account
    self.status = "closed"
  end

  def self.accounts
    @@accounts
  end






















end
