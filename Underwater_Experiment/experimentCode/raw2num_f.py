#! /usr/bin/python3
import scipy
import csv
import numpy as np

fname = "gnuradio_test_aug13/test_signal_raw.dat"
f = scipy.fromfile(open(fname), dtype=scipy.float32)
f = np.transpose(f)

file = open('test_signal_raw.csv', 'w')
for i in range(0,len(f)):
    print(f[i])
    file.write(str(f[i]) + '\n')
file.close()

