'''This is a helper file for just parzen window computations.'''

import numpy as np

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
    for i in range(n):
        sum += krnl((x-X[i])/h)
    return sum / (n*h)

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

def parzen_window(X, n=100):
    min = np.min(X) - 1
    max = np.max(X) + 1
    x = np.linspace(min,max,n)
    Px = np.zeros(n)
    mu = np.mean(X)
    sigma = np.std(X)
    if(sigma == 0):
        sigma = 1
    #print('mu = ' + str(mu))
    #print('sigma = ' + str(sigma))
    for i in range(n):
        Px[i] = kdens(x[i], X, sigma)
    mean = parzen_mean(x, Px) + mu
    variance = parzen_variance() + sigma
    return Px, x, mean, variance

