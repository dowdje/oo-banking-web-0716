class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  def initialize(sender, receiver, amount)
    @status = 'pending'
    @sender = sender
    @receiver = receiver
    @amount = amount

  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if @status == 'pending' && self.valid? && sender.balance >= amount
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = 'complete'
  else
    @status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    end
  end
end
