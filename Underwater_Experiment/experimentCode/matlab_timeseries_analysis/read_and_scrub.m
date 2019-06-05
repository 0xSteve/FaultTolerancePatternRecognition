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
loc = 3;
trans = 10;
%bring in the data
%test_signal_raw = csvread('test_signal_raw.csv');
filename = ['sendloc' num2str(loc) '_trans' num2str(trans) '_laketrial_aug13_2018_raw_mag.csv'];
test_signal_raw = csvread(filename);
phasefilename = ['sendloc' num2str(loc) '_trans' num2str(trans) '_laketrial_aug13_2018_raw_complex.csv'];
X = csvread(phasefilename);

%local vars
Fs = 44100; %samp rate.
N = Fs/10; %defined in GNURadio.
f = 1200; %frequency of interest.

[fft, fr] = get_upper_fft(test_signal_raw, Fs, N);
[X, fr2] = get_fft2(X, Fs, N);
%[fft,fr] = get_fft(test_signal_raw, Fs, N);
bin_of_interest = get_upper_bin(f, Fs, N);
width_of_interest = bin_of_interest + 100;
f_at_max = get_f_at_max(fft, Fs, N);
drift =  frequency_drift(f_at_max, f);
dc_bias = get_dc_bias(fft);
max_vec = get_max_vec(fft);
muh_title = ['Location ' num2str(loc) ' Transmission ' num2str(trans)];
%plot_fft_samples(fr, fft, muh_title, 0.5)

%Okay, so min and max phase is obviously kind of useless...
%obviousl in retrospect. But phase, and amplitude distributions are
%going to be useful.
max_phase = get_max_phase(X);
min_phase = get_min_phase(X);

%test out standardization functions.
M = [drift dc_bias max_vec];
Y = standardize_vector(M, 'minmaxing');

[phases] = get_phases(X, 10000);
mags = get_magnitudes(X);
upper_phases = get_upper_phases(X, N, 10000);











