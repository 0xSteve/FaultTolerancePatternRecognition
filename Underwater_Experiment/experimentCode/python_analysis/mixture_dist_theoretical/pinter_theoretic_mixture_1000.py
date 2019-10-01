#! /usr/bin/python3
import csv
import numpy as np
from parzen import *
import time #get rid of this soon

li = [];
file_name = '../../matlab_timeseries_analysis/theoretic_results/mixture_res30x1000.csv'
with open(file_name,'r') as csvfile:
    muh_file = csv.reader(csvfile)
    for row in muh_file:
        li.append(row)
Y = np.array(li).astype(np.float)
#print(np.shape(Y))
#time.sleep(10)
trans = 0
max_trans = 1000
gran = 1000
Z = np.zeros([gran,max_trans])
#with open('../../matlab_timeseries_analysis/theoretic_results/res31x5_sln.csv', 'w') as csvfile:
#muh_writer = csv.writer(csvfile)
while(trans < max_trans):
    X = []
    #Okay, so every vector is of length 31, so I can just grab every 31 data
    #pts.
    X = Y[:,trans]
    #print(X)
    #time.sleep(10)
    X = np.transpose(X)
    #print('\nTest data:')
    #print(X)
    Px, x, mean, var = parzen_window(X, -3.25, 10.25, gran, 0.1)
    #print('\nEstimations:')
    #print('Distribution:')
    #print(Px)
    #print('Interval:')
    #print(x)
    #print('Mean:')
    #print(mean)
    #print('Variance:')
    #print(var)
    #print('\n==================================================\n')
    #print('transmission ' + str(trans + 1))
    #print('\n==================================================\n')
    Z[:,trans] = Px
    trans += 1
    #time.sleep(10)
with open('../../matlab_timeseries_analysis/theoretic_results/mixture_res30x1000_sln.csv', 'w') as csvfile:
    muh_writer = csv.writer(csvfile)
    for row in range(gran):
        muh_writer.writerow(Z[row])

