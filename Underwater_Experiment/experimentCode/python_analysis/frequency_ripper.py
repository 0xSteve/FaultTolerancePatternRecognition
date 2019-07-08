#! /usr/bin/python3
import csv
import numpy as np
from helper import *

li = [];
file_name = 'results/short_raw_frequency.csv'
with open(file_name,'r') as csvfile:
    muh_file = csv.reader(csvfile)
    for row in muh_file:
        li.append(row)

X = np.array(li).astype(np.float)
#print(X[:,0])
X = np.transpose(X)
gran = 600
muh_pdf, muh_range, muh_mean, muh_var = parzen_window(X[0,:], pts=310, granularity=gran)
muh_pdf2, muh_range, muh_mean, muh_var = parzen_window(X[1,:], pts=310, granularity=gran)
muh_pdf3, muh_range, muh_mean, muh_var = parzen_window(X[2,:], pts=310, granularity=gran)

with open('../matlab_timeseries_analysis/results/frequency_pdf.csv', 'w') as csvfile:
    muh_writer = csv.writer(csvfile)
    for row in range(0,len(muh_pdf)):
        #print(muh_pdf[row], muh_pdf2[row], muh_pdf3[row])
        muh_writer.writerow({muh_pdf[row], muh_pdf2[row], muh_pdf3[row]})

print('Done Frequency Rip.')
