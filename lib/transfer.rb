class Transfer
attr_accessor :status
attr_reader :sender, :receiver, :amount

def initialize(sender, receiver, amount)
  @sender = sender
  @receiver = receiver
  @amount = amount
  @status = "pending"
end

def valid?
  if sender.valid? && receiver.valid?
    true
  else
    false
  end
end

def execute_transaction
  if status == "pending" && sender.balance >= amount
    sender.balance -= amount
    receiver.balance += amount
    self.status = "complete"
  elsif sender.balance < amount || sender.status = "closed"
    self.status = "rejected"
    "Transaction rejected. Please check your account."
  end
end

def reverse_transfer
  if self.status == "complete"
    receiver.balance -= amount
    sender.balance += amount
  end
end

end 