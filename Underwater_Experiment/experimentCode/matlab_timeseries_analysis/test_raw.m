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

%Turn on for testing plots.
% for i=1:length(fft(1,:))
%     figure
%     plot(fr, fft(:,i));
%     ylabel('Amplitude')
%     xlabel('Frequency (kHz)')
%     my_title = ['FFT plot of Send Location 2, Transmission 2, Sample ' num2str(i)];
%     title(my_title)
% end

max_vec = [];
frequency_vec = [];
for i=1:length(fft(1,:))
    [maximum, index] = max(fft(:,i));
    max_vec = [max_vec maximum];
    frequency_vec = [frequency_vec abs(fr(index))];
end
frequency_vec = frequency_vec';
frequency_vec = frequency_vec * 1000;

[res, maxdex, mindex] = remove_suspects(frequency_vec);
for i=1:length(fft(1,:))
    if(i == maxdex || i == mindex)
        figure
        plot(fr, fft(:,i));
        ylabel('Amplitude')
        xlabel('Frequency (kHz)')
        my_title = ['FFT plot of Send Location 1, Transmission 2, Sample ' num2str(i)];
        title(my_title)
    end
end

abs(mean(frequency_vec) - mean(res))
    






























































