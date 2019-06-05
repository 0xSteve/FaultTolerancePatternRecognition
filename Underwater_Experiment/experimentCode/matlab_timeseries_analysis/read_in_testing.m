%clean it up.
close all; clear; clc;

%bring in the data
test_signal_raw = csvread('test_signal_raw.csv');
%test_signal_raw = csvread('sendloc1_trans4_laketrial_aug13_2018_raw_mag.csv');
% Silly, Steve, the fact that you had to do this should have been a massive
% indicator that you weren't
%test_signal_raw = test_signal_raw(:,2);

%local vars
Fs = 44100; %samp rate.
fft_size = Fs/10; %defined in GNURadio.
Fn = fft_size / 2; %This is the folding (Nyquist) frequency of each fft.
Fmax = Fs/2; %Fmax is also the Nyquist (folding) frequency of the signal.
delta_f = Fmax / Fn; %FFT frequency bin size.
segment = 1;
fft = [];
next_segment = segment + (fft_size - 1);
while next_segment < length(test_signal_raw)
    nfft = test_signal_raw(segment:next_segment);
    fft = [fft nfft];
    segment = next_segment;
    next_segment = next_segment + (fft_size - 1);
end
fr = ((-Fn+0.5):(Fn-0.5))';
fr = (fr * delta_f)/1000;