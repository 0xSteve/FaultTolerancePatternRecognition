#!/bin/bash
#The usage of this is ./automatic <num locations> <num transmissions> 
#<output file>
SEND_LOC=$1
TRANS_NUM=$2
#Use this line for the C program.
#EXEC="./../experimentCode/raw2num_f"
#Use this line for the scipy python program.
EXEC="./../experimentCode/raw_to_complex.py"
#OUT_DIR=$3
FOLDER=$3
#Try to let the user know what's up...
echo "Folder: $FOLDER"
echo "Send location: $SEND_LOC"
echo "Transmission number: $TRANS_NUM"

echo $SEND_LOC
for i in `seq 1 $SEND_LOC`; do
   for j in `seq 1 $TRANS_NUM`; do
	   echo "Input file: 
	   $FOLDER""/sendloc$i""_trans$j""_laketrial_aug13_2018_$FOLDER"".dat"
	   echo "Output file:
	   $FOLDER""/sendloc$i""_trans$j""_laketrial_aug13_2018_$FOLDER"".csv"
       $EXEC $FOLDER""_dat/sendloc$i""_trans$j""_laketrial_aug13_2018_$FOLDER"".dat
        echo "$Processing transmission number $j/$TRANS_NUM send location $i/$SEND_LOC." 
        sleep 1;
    done
done
echo "Exit"
