# boots up new Oyster
class Oystercard
  MIN_BALANCE = 1
  attr_reader :balance
  attr_accessor :in_journey
  def initialize(monies = 0)
    @balance = monies
    @in_journey = false
  end

  def top_up(amount)
    raise 'error: balance cannot exceed 90' if @balance + amount > 90
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    fail 'Error: Insufficient funds' if @balance.zero?
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    deduct(MIN_BALANCE)
  end
end

