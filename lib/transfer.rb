
require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender #instance of bankAccount - Conor
    @receiver = receiver #instance of bankAccount -Conor
    @status = "pending"
    @amount = amount
  end 
#sender.valid is calling on valid method in BankAccount & can because Sender is an instance of bankAccts 
#sender.status

  def valid? #Conor to review
    sender.valid? && receiver.valid? 
  end

  
  def execute_transaction
    if self.status == "pending" && sender.balance > amount && valid?
      sender.balance -= @amount
      receiver.balance += @amount 
      self.status = "complete"
    else 
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 

  end 

  def reverse_transfer
    if execute_transaction 
      receiver.balance -= @amount
      sender.balance += @amount
      self.status = "reversed"
    end
  end


end  

