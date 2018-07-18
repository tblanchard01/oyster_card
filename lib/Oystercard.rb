# boots up new Oyster
class Oystercard
  MIN_BALANCE = 1
  attr_reader :balance
  attr_accessor :in_journey, :entry_station
  def initialize(monies = 0)
    @balance = monies
    @in_journey = false
    @entry_station = nil 
  end

  def top_up(amount)
    raise 'error: balance cannot exceed 90' if @balance + amount > 90
    @balance += amount
  end

  def touch_in(entry_station)
    raise 'Error: Insufficient funds' if @balance.zero?
    @in_journey = true
    @entry_station = entry_station

  end

  def touch_out
    @in_journey = false
    deduct(MIN_BALANCE)
  end

  private

  def deduct(amount)
    @balance -= amount
  end
end
