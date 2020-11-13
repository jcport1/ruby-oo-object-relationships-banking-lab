# require 'pry'
class Transfer
  # your code here
  attr_accessor :receiver, :sender, :amount, :status

  def initialize(sender,receiver, amount, status= "pending")

    @sender = sender
    @receiver = receiver
    @amount = amount 
    @status = status   

  end 

  def valid?

    self.sender.valid?
    self.receiver.valid?

  end 

def execute_transaction

  #a transaction can only happen if it's pending & meets other conditions 

  if self.valid? && self.status == "pending" && self.sender.balance > self.amount 

  self.sender.balance -= self.amount
  self.receiver.balance += self.amount
  self.status = "complete"

  else 
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."

end
end 

def reverse_transfer

  # if self.valid? && self.status == "completed" && self.sender.balance > self.amount 

  if self.valid? && self.status == "complete" && self.receiver.balance > self.amount 

    self.sender.balance = self.sender.balance + self.amount
    self.receiver.balance = self.receiver.balance - self.amount
    self.status = "reversed"

  end 

  # else 

  #   self.status = "rejected"
    
  #   self.status = "complete"

  # else 

  # end 

end 

end
