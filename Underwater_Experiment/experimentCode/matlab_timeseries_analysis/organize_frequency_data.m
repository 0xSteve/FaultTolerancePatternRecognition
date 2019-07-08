%Let's put this in a format that makes it a no brainer for getting some
%easy data with my Parzen setup.
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
%local vars
Fs = 44100; %samp rate.
N = Fs/10; %defined in GNURadio.
f = 1200; %frequency of interest.
res = [];
%get the maximum length. Probably a better way, but I'm short on time so...
max_len = 0;
while(loc < 4)
        while(trans < 11)
            phasefilename = ['sendloc' num2str(loc) '_trans' num2str(trans) '_laketrial_aug13_2018_raw_complex.csv'];
            X = csvread(phasefilename);
            [X, fr] = get_fft2(X, Fs, N);
            cur_len = length(X);
            if cur_len > max_len
                max_len = cur_len;
            end
            trans = trans + 1;
        end
    trans = 1;
    loc = loc + 1;
end

loc = 1;
trans = 1;
res = [];

while(loc < 4)
    t_res = [];    
    while(trans < 11)
        phasefilename = ['sendloc' num2str(loc) '_trans' num2str(trans) '_laketrial_aug13_2018_raw_complex.csv'];
        X = csvread(phasefilename);
        [X, fr] = get_fft2(X, Fs, N);
        f_vec = get_f2(X,Fs,N);
        this_len = length(X);
        remainder = max_len - this_len;
        if this_len > 0
            %averages
            avg_f_vec = mean(f_vec);
            for li = 1:remainder
                f_vec = [f_vec; avg_f_vec];
            end
        end
        t_res = [t_res; f_vec];
        trans = trans + 1;
    end
    res = [res t_res];
    trans = 1; %Yes, I can put this at the beginning and define it once...
    loc = loc + 1;
end
% res = standardize_vector(res, 'minmaxing');
% res = normalize(res);
resfilename = ['results/short_raw_frequency.csv'];
csvwrite(resfilename, res);