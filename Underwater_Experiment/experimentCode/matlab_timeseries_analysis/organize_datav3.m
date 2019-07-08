%This script setups the normalized dataset for only the 26 long vectors.
%this will standardize the vector length, and normalize
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
%local vars
Fs = 44100; %samp rate.
N = Fs/10; %defined in GNURadio.
f = 1200; %frequency of interest.

loc = 1;
trans = 1;
max_len = 31; %I'm being lazy here.
while(loc < 4)
    res = [];
    
    %This might not be the best solution, but it is certainly expediant.
   
    while(trans < 11)
        phasefilename = ['sendloc' num2str(loc) '_trans' num2str(trans) '_laketrial_aug13_2018_raw_complex.csv'];
        X = csvread(phasefilename);
        [X, fr] = get_fft2(X, Fs, N);
        cur_len = length(X);
        trans = trans + 1;
    end
    trans = 1;
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
        
        trans_num = zeros(max_len, 1) + trans;
        %Before adding to the results, add rows to compensate for being
        %shorter than the longest vector. Instead of adding NaN, let us
        %use the average value of the segment.
        this_len = length(X);
        remainder = max_len - this_len;
        if this_len > 0
            %averages
            avg_mag = mean(max_mags);
            avg_dc_bias = mean(dc_bias);
            avg_f_vec = mean(f_vec);
            for li = 1:remainder
                max_mags = [max_mags; avg_mag];
                dc_bias = [dc_bias; avg_dc_bias];
                f_vec = [f_vec; avg_f_vec];
            end
        end
        %f_vec = f_vec - 1200; %make this about drift.
        f_vec(1) = 1200; %remove this outlier
%         f_vec = normalize(f_vec, 'norm');
%         f_vec = make_p_vec(f_vec);
        %t_res = standardize_vector([max_mags, dc_bias],'minmaxing');
        t_res = [max_mags dc_bias];
        t_res = [trans_num f_vec t_res];
        res = [res; t_res];
        %[trans number, frequency, mags, dc bias] 
        %time to increment and start anew...
        trans = trans + 1;
        
    end
    resfilename = ['results/short_raw_sendloc' num2str(loc) '.csv'];
    csvwrite(resfilename, res);
    %get ready for the next location...
    res = [];
    loc = loc + 1;
end