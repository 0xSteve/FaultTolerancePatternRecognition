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

#===================================================

np.random.seed(2)
n = 31
X = np.random.normal(0.0, 1, size=n) #mean=0 std=1
print('\nSample data: ')
print(X)

estimated = np.zeros(n) #estimate the PDF
for i in range(n):
    estimated[i] = kdens(X[i],X)

mean = parz_mean(X, estimated)
print("\nEstimated PDF: ")
print(estimated)
print('\nThe sum of the estimated PDF is: ')
print(np.sum(estimated))
print('\nThe estimated mean is: ')
print(mean)

plt.plot(X, estimated, '.')
plt.axvline(x=mean)
plt.show()
