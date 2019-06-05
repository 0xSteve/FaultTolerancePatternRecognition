#!/bin/bash
#The usage of this is
EXEC="./../raw2num_f"
#NUM is the number of numbers in the file. This just has to be larger than the
#largest number.
#Only want the first 2.8751 seconds.
NUM=126000
OFFSET=0
$EXEC test_signal_raw.dat test_signal_raw.csv $OFFSET $NUM
echo "Exit"
