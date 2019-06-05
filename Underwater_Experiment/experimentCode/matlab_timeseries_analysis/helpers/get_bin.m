function [lower_bin, upper_bin] = get_bin(f, Fs, N)
    %given a frequency, find the FFT bin.
    %must add 1
    upper_bin = (f * N / Fs) + (N/2) + 1;
    lower_bin = (N/2) - (f * N / Fs) + 1;
end