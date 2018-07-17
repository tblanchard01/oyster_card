require 'Oystercard'

describe Oystercard do
  it 'checks that Osystercard.new to create new Oyster' do
    expect(subject).to be_instance_of Oystercard
  end
  it 'checks that a new oyster has a balance of 0' do
    expect(subject.balance).to eq 0
  end
  describe '.top_up' do
    it 'allows user to top up card by passing an ammount into top up method' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end
    it 'balance is 10 when top_up 10 is called (new card)' do
      subject.top_up(10)
      expect(subject.balance).to eq 10
    end
    it 'top_up can top up any card' do
      card = Oystercard.new
      expect { card.top_up(10) }.to change { card.balance }.by(10)
    end
    it 'prevents card being topped up over 90' do
      subject.top_up(10)
      expect { subject.top_up(100) } .to raise_error 'error: balance cannot exceed 90'
    end
  end

  it 'allows fares to be deducted from exisiting card balance' do
    subject.top_up(20)
    expect { subject.deduct(10) }.to change { subject.balance }.by(-10)
  end
  describe 'a journey' do
    it 'responds to journey method' do
      expect(subject).to respond_to(:in_journey)
    end
    it 'touching in sets in journey to true' do
      expect { subject.touch_in }.to change { subject.in_journey }.to(true)
    end
  end
  it 'touching out sets in journey to false' do
    subject.touch_in
    expect { subject.touch_out }.to change { subject.in_journey }.to(false)
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
# I need to touch in and out.
