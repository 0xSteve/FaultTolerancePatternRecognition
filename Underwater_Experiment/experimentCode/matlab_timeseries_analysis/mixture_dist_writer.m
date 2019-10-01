close all; clear; clc;

n = 30; % number of elements.
N = 100000; % number of vectors.
mu = 0; % mean.
mu2 = 4;
sigma = 1; % standard deviation.
sigma2 = 3;
resfilename = ['theoretic_results/mixture_res' num2str(n) 'x' num2str(N) '.csv'];
%%%
res = normrnd(mu, sigma, [n/2 N]);
%res = [res; (rand([n/2 N])*1 + 4)];
res = [res; (normrnd(mu2, sigma2, [n/2 N]))];
histogram(res, 1000)
csvwrite(resfilename, res);