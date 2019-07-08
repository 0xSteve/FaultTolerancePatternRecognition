#! /usr/bin/python3
import csv
import numpy as np
from helper import *

li = [];
file_name = '../matlab_timeseries_analysis/results/short_raw_sendloc1.csv'
with open(file_name,'r') as csvfile:
    muh_file = csv.reader(csvfile)
    for row in muh_file:
        li.append(row)
X = np.array(li).astype(np.float)
#print(np.shape(X))
#A thing worth doing here is to loop through the first column, and make
#individual parzen data and begin writing it out as is.

#Sort of do the same thing as with the MATLAB code, and just  loop through the
#transmissions.
trans = 1
start = 0
end = 31 #because 31 datapts
gran = 10
with open('../matlab_timeseries_analysis/results/solution_loc1.csv', 'w') as csvfile:
    muh_writer = csv.writer(csvfile)
    while(trans < 11):
        Y = []
        #Okay, so every vector is of length 31, so I can just grab every 31 data
        #pts.
        Y = X[start:end,:]
        Y = np.transpose(Y)
        #print(np.shape(Y[1,:]))
        #print(Y[1,:])
        #print('Start is: ' + str(start))
        #print('End is: ' + str(end))
        #print('Trans is: ' + str(trans))
        #print(np.std(Y[1,:]))
        freq_pdf, freq_range, freq_mean, freq_var = parzen_window(Y[1,:],
                granularity=gran)
        print('sum of frequency_pdf_estimate is: ' + str(np.sum(freq_pdf)))
        mags_pdf, mags_range, mags_mean, mags_var = parzen_window(Y[2,:],
                granularity=gran)
        #print('Magnitude ends here.')
        dc_bias_pdf, dc_bias_range, dc_bias_mean, dc_bias_var = parzen_window(Y[3,:], 
                granularity=gran)
        #print('dc bias ends here.')
        for row in range(0, len(freq_pdf)):
            muh_writer.writerow([trans, freq_pdf[row], freq_range[row], freq_mean, freq_var,
                mags_pdf[row], mags_range[row],
                mags_mean, mags_var, dc_bias_pdf[row],
                dc_bias_range[row], dc_bias_mean, dc_bias_var])
        start = end
        end += 31
        trans += 1
