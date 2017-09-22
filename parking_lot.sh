#!/bin/sh
#!/usr/bin/env ruby
echo 'ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin15]'
echo 'running specs for car class'
rspec car_spec.rb
echo 'running specs for parkinglot class'
rspec parkinglot_spec.rb
if [ $# -eq 0 ]; then
    echo 'program execution with command line inputs'
    echo 'enter to break'
    ruby parking.rb
else
    echo 'program execution with input file'
    #ruby parking.rb --filename=file_inputs.txt
    if [ -f $1 ]; then
        ruby parking.rb --filename=$1
    else
        echo 'No file found'
    fi
fi
