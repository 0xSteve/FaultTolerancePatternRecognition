%This script setups the normalized dataset for only the 4410 long vectors.
%raw data.
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
        phases = get_upper_phases(X, N, 10000);
        mags = get_upper_mags(X, N);
        len = length(mags(1,:));
        t2_res = [];
        for li = 1 : len
            t_res = [];
            t_mags = [];
            t_phases = [];
            fft_num = length(mags(:,li));
            trans_num = zeros(fft_num, 1) + li+(trans-1)*len;
            t_mags = [t_mags; mags(:,li)];
            t_phases = [t_phases; phases(:,li)];
            Y = standardize_vector([t_mags, t_phases], 'minmaxing');
            t_res = [trans_num Y];
            t2_res = [t2_res; t_res];
        end
        res = [res; t2_res];
        %time to increment and start anew...
        trans = trans + 1;
    end
    resfilename = ['results/clean_sendloc' num2str(loc) '.csv'];
    csvwrite(resfilename, res);
    %get ready for the next location...
    res = [];
    l_res = [];
    loc = loc + 1;
    trans = 1;
end