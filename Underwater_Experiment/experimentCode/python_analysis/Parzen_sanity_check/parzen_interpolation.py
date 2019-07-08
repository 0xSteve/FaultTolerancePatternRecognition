#parzen.py
#estimate probability density function from a sample

import numpy as np
import matplotlib.pyplot as plt

def krnl(x):
    #standard normal kernel, mean = 0, std = 1
    num = np.exp(-(np.power(x,2)/2.0))
    denom = np.sqrt(2*np.pi)
    return num / denom

def kdens(x,X):
    n = len(X)
    sigma = np.std(X)
    #Silverman's rule of thumb
    h = np.power((4.0 / (3.0 * n)), 0.20) * sigma
    sum = 0.0
    for i in range(n):
        sum += krnl((x-X[i])/h)
    return sum / (n*h)

def parz_mean(X,Px):
    n = len(Px) #len(Px) == len(X)
    dx = 1/n
    mean = 0
    for i in range(n):
        mean += X[i] * Px[i] * dx
    return mean

def parz_var():
    return 0

def parzen_window(x, X):
    #for now, let's assume standard normal.
    n = len(x)
    estimated = np.zeros(n)
    for i in range(n):
        estimated[i] = kdens(x[i], X)
    return estimated

#===================================================

np.random.seed(2)
n = 100
m = 31
X = np.random.normal(0.0,1,size=m) #test points
print('\nThe test points are:')
print(X)
min = np.min(X)
max = np.max(X)
x = np.linspace(min, max, n)
estimated = parzen_window(x, X)
mean = parz_mean(x, estimated)
print('\nThe estimated PDF is:')
print(estimated)
print('\nThe estimated mean is: ' + str(mean))

plt.plot(x, estimated, '.')
plt.axvline(x=mean)
plt.show()
