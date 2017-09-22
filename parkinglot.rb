# parking lot class with cars being composited in it
class ParkingLot
  def initialize(counter)
    @counter = counter
    @cars = {}
    @available_slots = (1..counter).to_a
  end

  def counter
    @counter ||= 0
  end

  def counter=(v)
    @counter = v.to_i
  end

  # check if the parking lot is full
  def full?
    @counter.zero? || @counter.nil?
  end

  def park(name, color)
    return false if full? # 'Sorry, parking lot is full' if full?
    @counter += -1
    # take first available slot nearest one
    slot = @available_slots.delete_at(0)
    @cars[slot] = Car.new(name, color)
    # "Allocated slot number: #{slot}"
    slot
  end

  def leave(slot)
    return false if @cars[slot.to_i].nil?
    @cars.delete(slot.to_i)
    @available_slots.push(slot.to_i).sort!
    @counter += 1
    slot
  end

  def slot_numbers_for_cars_with_colour(color)
    slots = []
    @cars.each do |slot, car|
      if car.color == color
        slots.push(slot)
      end
    end
    slots.join(',')
  end

  def slot_number_for_registration_number(number)
    @cars.each do |slot, car|
      return slot if car.name == number
    end
    'Not found'
  end

  def registration_numbers_for_cars_with_colour(color)
    numbers = []
    @cars.each do |_slot, car|
      if car.color == color
        numbers.push(car.name)
      end
    end
    numbers.join(',')
  end

  def status
    puts "Slot No.\t Registration No \t Colour"
    @cars.each do |slot, car|
      puts "#{slot} \t #{car.name} \t #{car.color}"
    end
  end
end
