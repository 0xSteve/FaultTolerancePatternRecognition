#! /usr/bin/python3
import csv
import numpy as np
from parzen import *

li = [];
file_name = '../matlab_timeseries_analysis/results/short_raw_sendloc1.csv'
with open(file_name,'r') as csvfile:
    muh_file = csv.reader(csvfile)
    for row in muh_file:
        li.append(row)
Y = np.array(li).astype(np.float)
Y = Y[:,1:len(Y)]
#print(Y)
trans = 1
start = 0
end = 31 #because 31 datapts
gran = 1000

with open('../matlab_timeseries_analysis/results/solution_loc1.csv', 'w') as csvfile:
    muh_writer = csv.writer(csvfile)
    while(trans < 11):
        X = []
        #Okay, so every vector is of length 31, so I can just grab every 31 data
        #pts.
        X = Y[start:end,:]
        X = np.transpose(X)
        print('\nTest data:')
        print(X)
        fPx, fx, fmean, fvar = parzen_window(X[0,:], 1140, 1260)
        print('\nEstimations:')
        print('Distribution:')
        print(fPx)
        print('Interval:')
        print(fx)
        print('Mean:')
        print(fmean)
        print('Variance:')
        print(fvar)
        print('\n==================================================\n')
        print('transmission ' + str(trans))
        print('\n==================================================\n')

        mPx, mx, mmean, mvar = parzen_window(X[1,:], 0, 1600)
        dcbf, dcbx, dcbmean, dcbvar = parzen_window(X[2,:],0, 1)
        for row in range(gran):
            muh_writer.writerow([trans, 
                fPx[row], fx[row], fmean, fvar,
                mPx[row], mx[row], mmean, mvar,
                dcbf[row], dcbx[row], dcbmean, dcbvar 
                ])
        start = end
        end += 31
        trans += 1
