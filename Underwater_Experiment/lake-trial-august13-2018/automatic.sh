#!/bin/bash

SEND_LOC=$1
TRANS_NUM=$2
EXEC="./../experimentCode/raw2num_f"
#OUT_DIR=$3
FOLDER=$3

#Save some typing later...
a="sendloc"
b="_trans"
c="_laketrial_aug13_2018_$FOLDER"
d="_ang"
e="_mag"
f=".csv"
g="_dat/"
h=".dat"
xD="../lake-trial-august13-2018/"

echo $SEND_LOC
for i in `seq 1 $SEND_LOC`; do
   for j in `seq 1 $TRANS_NUM`; do
       $EXEC $FOLDER""_dat/sendloc$i""_trans$j""_laketrial_aug13_2018_$FOLDER""_mag.dat $FOLDER""_mag/sendloc$i""_trans$j""_laketrial_aug13_2018_$FOLDER""_mag.csv  0 132300
        echo "$Processing transmission number $j/$TRANS_NUM send location $i/$SEND_LOC." 
        sleep 1;
    done
done
echo "Exit"
