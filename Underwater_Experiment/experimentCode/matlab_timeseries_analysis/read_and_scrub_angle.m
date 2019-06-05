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
loc = 1;
trans = 1;
%bring in the data
%test_signal_raw = csvread('test_signal_raw.csv');
filename = ['sendloc' num2str(loc) '_trans' num2str(trans) '_laketrial_aug13_2018_raw_mag.csv'];
test_signal_raw = csvread(filename);

%local vars
Fs = 44100; %samp rate.
N = Fs/10; %defined in GNURadio.
f = 1200; %frequency of interest.
