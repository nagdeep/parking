require './car.rb'
require './parkinglot.rb'

describe ParkingLot do
  let(:parking_lot) { ParkingLot.new(6) }

  it 'should accept slots in parking lot' do
    expect(parking_lot.counter).to eq(6)
  end

  describe '.full' do
    it 'should return false if the counter is not null or 0' do
      expect(parking_lot.full?).to eq(false)
    end

    it 'should return true is the available slots is zero' do
      parking_lot.counter = 0
      expect(parking_lot.full?).to eq(true)
    end
  end

  describe '.park' do
    it 'should accept car with number and color and store in parking lot' do
      expect { parking_lot.park('KA 01 EA 0001', 'White') }
        .to change { parking_lot.counter }.by(-1)
    end
  end

  describe '.leave' do
    it 'should be able to leave the lot and make free space in lot' do
      slot_number = parking_lot.park('KA 01 EA 0002', 'White')
      expect { parking_lot.leave(slot_number) }
        .to change { parking_lot.counter }.by(1)
    end

    it 'should return false if the slot is empty' do
      expect(parking_lot.leave(5)).to eq(false)
    end
  end

  describe '.slot_numbers_for_cars_with_colour' do
    it 'should provide slot numbers alloted for car with given color' do
      slot_number = parking_lot.park('KA 01 EA 0002', 'White')
      expect(parking_lot.slot_numbers_for_cars_with_colour('White'))
        .to eq(slot_number.to_s)
    end
  end

  describe '.slot_number_for_registration_number' do
    it 'should provide slot number based on reg number' do
      slot_number = parking_lot.park('KA 01 EA 0002', 'White')
      expect(parking_lot.slot_number_for_registration_number('KA 01 EA 0002'))
        .to eq(slot_number)
    end

    it 'should return not found if invalid number is passed' do
      expect(parking_lot.slot_number_for_registration_number('KA 01 EA 0004'))
        .to eq('Not found')
    end
  end

  describe '.registration_numbers_for_cars_with_colour' do
    it 'should provide reg number of car with given colour' do
      parking_lot.park('KA 01 EA 0002', 'White')
      expect(parking_lot.registration_numbers_for_cars_with_colour('White'))
        .to eq('KA 01 EA 0002')
    end
  end

  describe '.status' do
    it 'should provide current status of lot in table' do
      parking_lot.park('KA 01 EA 0003', 'White')
      expect(parking_lot.status).not_to be_nil
    end
  end
end
