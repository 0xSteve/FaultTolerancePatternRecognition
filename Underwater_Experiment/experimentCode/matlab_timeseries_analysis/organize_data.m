%This script setups the normalized dataset for only the 26 long vectors.
% frequency 1200Hz
% fft_size 3675
% number of samples 126000
% Fs 44100
% Frequency = bin*Fs/fft_size
% bin = Frequency*ftt_size/Fs
% bin 100 should have 1200Hz
%
%clean it up.
close all; clear; clc;

loc = 1;
trans = 1;
%local vars
Fs = 44100; %samp rate.
N = Fs/10; %defined in GNURadio.
f = 1200; %frequency of interest.
res = [];

while(loc < 4)
    while(trans < 11)
        phasefilename = ['sendloc' num2str(loc) '_trans' num2str(trans) '_laketrial_aug13_2018_raw_complex.csv'];
        X = csvread(phasefilename);
        [X, fr] = get_fft2(X, Fs, N);
        %actual data extraction stuff...
        phases = get_phases(X, 10000);
        mags = get_upper_mags(X, N);
        dc_bias = get_dc_bias(mags);
        max_mags = get_max(mags);
        f_vec = get_f2(X,Fs,N);
        t_res = standardize_vector([max_mags, dc_bias],'minmaxing');
        trans_num = zeros(length(f_vec), 1) + trans;
        t_res = [trans_num f_vec t_res];
        res = [res; t_res];       
        %time to increment and start anew...
        trans = trans + 1;
    end
    resfilename = ['results/short_clean_sendloc' num2str(loc) '.csv'];
    csvwrite(resfilename, res);
    %get ready for the next location...
    res = [];
    l_res = [];
    loc = loc + 1;
    trans = 1;
end