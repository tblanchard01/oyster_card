require 'Oystercard'

describe Oystercard do
  let(:station){ double :station }

  let(:card) { described_class.new }
  it 'checks that Osystercard.new to create new Oyster' do
    expect(card).to be_instance_of Oystercard
  end
  it 'checks that a new oyster has a balance of 0' do
    expect(card.balance).to eq 0
  end
  describe '.top_up' do
    it 'allows user to top up card by passing an amount into top up method' do
      expect(card).to respond_to(:top_up).with(1).argument
    end
    it 'balance is 10 when top_up 10 is called (new card)' do
      card.top_up(10)
      expect(card.balance).to eq 10
    end
    it 'top_up can top up any card' do
      expect { card.top_up(10) }.to change { card.balance }.by(10)
    end
    it 'prevents card being topped up over 90' do
      card.top_up(10)
      expect { card.top_up(100) } .to raise_error 'error: balance cannot exceed 90'
    end
  end

  describe 'a journey' do
    it 'responds to journey method' do
      expect(card).to respond_to(:in_journey)
    end
    it 'touching in sets in journey to true' do
      card.top_up(described_class::MIN_BALANCE)
      expect { card.touch_in(station) }.to change { card.in_journey }.to(true)
    end
  end
  it 'touching out sets in journey to false' do
    card.top_up(described_class::MIN_BALANCE)
    card.touch_in(station)
    expect { card.touch_out }.to change { card.in_journey }.to(false)
  end
  it 'user cannot touch in, if their balance is less than 1' do
    expect { card.touch_in(station) } .to raise_error 'Error: Insufficient funds'
  end
  it 'touching out causes the minimum fare to be deducted from the balance' do
    card.top_up(10)
    expect { card.touch_out }.to change { card.balance }.by(-described_class::MIN_BALANCE)
  end
  it 'records entry station on touch in' do 
  card.top_up(10)
    expect {card.touch_in(station)}.to change {card.entry_station}.to(station)
  end 
end

# In order to use public transport
# As a customer
# I want money on my card - green

# In order to keep using public transport
# As a customer
# I want to add money to my card - green

# In order to protect my money from theft or loss
# As a customer
# I want a maximum limit (of 90) on my card - green

# In order to pay for my journey
# As a customer
# I need my fare deducted from my card - green

# To close this issue, you'll need to test-drive three methods: touch_in, touch_out and in_journey?
# In order to get through the barriers.
# As a customer
# I need to touch in and out. - green

# In order to pay for my journey
# As a customer
# I need to have the minimum amount (£1) for a single journey. - green

# In order to pay for my journey
# As a customer
# When my journey is complete, I need the correct amount deducted from my card - green

# In order to pay for my journey
# As a customer
# I need to know where I've travelled from - green 