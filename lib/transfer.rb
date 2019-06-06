require "pry"

class Transfer


  attr_accessor :sender, :receiver, :status

  attr_reader :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end
    
  
  def execute_transaction
    if self.valid? && sender.balance > amount && self.status == "pending"
      self.status = "complete"
      sender.balance -= amount
      receiver.balance += amount
      
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end
end
