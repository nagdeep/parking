Language used : ruby v 2.4
Test runner : rspec - ruby

pre requisite:
ruby with version mentioned above
rspec to be installed
gem install rspec

Running the script : ./parking_lot.sh
Following actions are performed during script run
1. test specs are executed against the models (car and parkinglot)
2. checks for input file
3. else runs the program in interactive mode


Objects :
a. Car
  attributes : number and color

b. ParkingLot
  attributes : parking slots and cars in the lot
  map of the cars and their slot numbers are maintained to easy allocation and management


parking.rb :
driving code which works as controller in this case.


Assumptions :

- If user doesn't prepare parking lot and tries to park directly. System does the initialization with 6 slots in it.
- rspec installed in the system
