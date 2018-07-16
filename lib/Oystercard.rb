# boots up new Oyster
class Oystercard
  attr_reader :balance
  def initialize(monies = 0)
    @balance = monies
  end

  def top_up(ammount)
    raise 'error: balance cannot exceed 90' if @balance + ammount > 90
    @balance += ammount
  end
end
