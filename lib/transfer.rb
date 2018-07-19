require_relative 'bank_account'


class Transfer
  # your code here
  @@transfer = []

  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount

  end


  def valid?
    sender.valid? == true && receiver.valid? == true
  end

  def previous_transfers
    @@transfer.include?(self)
  end

  def execute_transaction
    #binding.pry
    if check_bal_amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif !previous_transfers && valid?
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
      @@transfer << self
    end
  end

  def self.transfer
    @@transfer
  end

  def check_bal_amount
    sender.balance < amount
  end

  def reverse_transfer
    if @@transfer.include?(self)
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end

  end


end
