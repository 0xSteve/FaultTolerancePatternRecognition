'''This is a helper file for just parzen window computations.'''

import numpy as np
#delete this after min/max troubleshooting is over
import time as t

def parzen_mean(X,Px):
    n = len(Px) #len(Px) == len(X)
    dx = 1/n
    mean = 0
    for i in range(n):
        mean += X[i] * Px[i] * dx
    return mean

def parzen_variance():
    return 0

def krnl(x):
    '''A kernel for assuming a standard normal distribution.'''
    #standard normal kernel, mean = 0, std = 1
    num = np.exp(-(np.power(x,2)/2.0))
    denom = np.sqrt(2*np.pi)
    return num / denom

def gaussian_krnl(x, sigma):
    numer = np.exp(-(np.power(x,2)/(2*np.power(sigma, 2))))
    denom = np.sqrt(2*np.pi)*sigma
    return numer / denom

def kdens(x,X, sigma):
    #kernel densities
    n = len(X)
    #Silverman's rule of thumb
    h = np.power((4.0 / (3.0 * n)), 0.20) * sigma
    sum = 0.0
    steps = 0
    for i in range(n):
        sum += krnl((x-X[i])/h)
        steps += 1
    return sum / (n * h), steps

def gkdens(x,X, mu, sigma):
    #gaussian kernel densities
    n = len(X)
    if(sigma == 0):
        sigma = 1
    #print('This is mu: ' + str(mu))
    #print('This is sigma: ' + str(sigma))
    #Silverman's rule of thumb
    h = np.power((4.0 / (3.0 * n)), 0.20) * sigma
    sum = 0.0
    for i in range(n):
        sum += gaussian_krnl(((x-X[i]-mu)/h), sigma)
    return sum / (n*h)

def parzen_window(X, min, max, n=1000, sigma=1):
    #A wee bit of trouble shooting here...
    #min = np.min(X) - 1
    #max = np.max(X) + 1
    #print('The minimum is: ' + str(min))
    #print('The maximum is: ' + str(max))
    #t.sleep(10)
    #Okay, so after trouble shooting, it looks like there is a little bit of a
    #problem with the selection of the minimum and maximum. What ought to be
    #done, is select the overall minimum and maximum of the parameter as
    #present in the csv file and use that to define the interval for the Parzen
    #interpolation.

    #here we go just a tiny bit out of range to smooth the edges. I can make
    #this even better, but not right now.
    min -= 1
    max += 1
    steps = 0
    x = np.linspace(min,max,n)
    Px = np.zeros(n)
    mu = np.mean(X)
    #sigma = np.std(X)
    #if(sigma == 0):
    #    sigma = 1
    #print('mu = ' + str(mu))
    #print('sigma = ' + str(sigma))
    for i in range(n):
        Px[i], count = kdens(x[i], X, sigma)
        steps += count
    mean = parzen_mean(x, Px) + mu
    variance = parzen_variance() + np.std(X)
    return Px, x, mean, variance, steps

