#! /usr/bin/python3
import sys
import scipy
import csv
import numpy as np

# get the console arguments
argv = sys.argv
if(argv[1] != ''):
    fname = argv[1]
else:
    print('file name not provided.')
    print('command must be of the form: ./raw_to_complex.py <file> <offset> ' +
          '<length>')

f = scipy.fromfile(open(fname), dtype=scipy.complex64)
f = np.transpose(f)
re = f.real
im = f.imag
fname = fname[0:-4]
folder = fname.split('dat')[0]
fname = fname.split(folder + 'dat')[1]
folder = folder + 'csv'
print('Folder: ' + folder)
print('File: ' + fname)
file = open(folder + fname + '.csv', 'w')
for i in range(0, len(f)):
    #print(f[i])
    file.write(str(re[i]) + ',' + str(im[i]) + '\n')
file.close
print('Exit Success')
