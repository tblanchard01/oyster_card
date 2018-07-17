# boots up new Oyster
class Oystercard
  attr_reader :balance
  attr_accessor :in_journey
  def initialize(monies = 0)
    @balance = monies
    @in_journey = false
  end

  def top_up(ammount)
    raise 'error: balance cannot exceed 90' if @balance + ammount > 90
    @balance += ammount
  end

  def deduct(ammount)
    @balance -= ammount
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end
end
