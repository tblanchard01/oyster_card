# boots up new Oyster
class Oystercard
  MIN_BALANCE = 1
  attr_reader :balance
  attr_accessor :in_journey, :entry_station, :exit_station, :list_of_journeys
  def initialize(monies = 0)
    
    @balance = monies
    @in_journey = false
    @entry_station = nil 
    @exit_station = nil
    @list_of_journeys = []
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

  def touch_out(exit_station)
    @in_journey = false
    @exit_station = exit_station
    deduct(MIN_BALANCE)

  end

  private

  def deduct(amount)
    @balance -= amount
  end
end 