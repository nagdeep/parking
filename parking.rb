# ruby parking.rb --filename=file_inputs.txt
# ruby parking.rb
require './car.rb'
require './parkinglot.rb'
def initialize_lot(counter)
  pl = ParkingLot.new(counter)
  puts "Created a parking lot with #{counter} slots"
  pl
end

def update_parking_lot(pl, input)
  action = input.split(' ')
  if action[0].downcase == 'park'
    slot = pl.park(action[1], action[2])
    if slot
      puts "Allocated slot number: #{slot}"
    else
      puts 'Sorry, parking lot is full'
    end
  elsif action[0].downcase == 'leave'
    slot = pl.leave(action[1])
    if slot
      puts "Slot number #{slot} is free"
    else
      puts 'Car not found in the slot'
    end
  elsif action[0].downcase == 'status'
    pl.status
  elsif action[0].downcase == 'registration_numbers_for_cars_with_colour'
    puts pl.registration_numbers_for_cars_with_colour(action[1])
  elsif action[0].downcase == 'slot_numbers_for_cars_with_colour'
    puts pl.slot_numbers_for_cars_with_colour(action[1])
  elsif action[0].downcase == 'slot_number_for_registration_number'
    puts pl.slot_number_for_registration_number(action[1])
  end
end

# input based on interactive inputs from command line
# enter to break the inputs
if ARGV[0].nil?
  input = gets
  if input.start_with? 'create_parking_lot'
    pl = initialize_lot(input.split(' ')[1].to_i)
  else
    pl = initialize_lot(6)
    update_parking_lot(pl, input)
  end

  while true
    input = gets
    if input =="\n"
      break
    end
    update_parking_lot(pl,input)
  end
else
  # input based on file input file_inputs.txt
  args = Hash[ ARGV.flat_map { |s| s.scan(/--?([^=\s]+)(?:=(\S+))?/) } ]
  filename = args['filename']
  f = File.open(filename)
  input = f.readline
  f.close

  if input.start_with? 'create_parking_lot'
    pl = initialize_lot(input.split(' ')[1].to_i)
  else
    pl = initialize_lot(6)
  end

  File.open(filename).each do |p_action|
    update_parking_lot(pl, p_action)
  end
end
