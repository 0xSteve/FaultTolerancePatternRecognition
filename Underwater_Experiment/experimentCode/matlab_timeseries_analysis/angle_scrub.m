% read in and analyse the raw test file.
% frequency 1200Hz
% fft_size 3675
% number of samples 126000
% Fs 44100
% Frequency = bin*Fs/fft_size
% bin = Frequency*ftt_size/Fs
% bin 100 should have 1200Hz
%
%What can be said for sure about a real-signal FT? Two things that I care
%about, at least for now. Namely, one can say that the minimum frequency
%and minimum magnitude can only be 0.

%clean it up.
close all; clear; clc;

%location number
loc = 2;
trans = 1;
%bring in the data
%test_signal_raw = csvread('test_signal_raw.csv');
phasefilename = ['sendloc' num2str(loc) '_trans' num2str(trans) '_laketrial_aug13_2018_raw_complex.csv'];
X = csvread(phasefilename);
%local vars
Fs = 44100; %samp rate.
N = Fs/10; %defined in GNURadio.
f = 1200; %frequency of interest.

[X, fr] = get_fft2(X, Fs, N);
phase=atan2(X{1}(:,2),X{1}(:,1))*180/pi;
figure
plot(fr,phase); %phase vs frequencies


X2=X{1};%store the FFT results in another array
%detect noise (very small numbers (eps)) and ignore them
threshold = max(abs(X{1}))/100; %tolerance threshold
X2(abs(X{1})<threshold) = 0; %maskout values that are below the threshold
phase2=atan2(X2(:,2),X2(:,1))*180/pi; %phase information
figure
plot(fr,phase); %phase vs frequencies
title('is better?')

Y1 = standardize_vector(phase, 'minmaxing');
Y2 = standardize_vector(phase2, 'minmaxing');