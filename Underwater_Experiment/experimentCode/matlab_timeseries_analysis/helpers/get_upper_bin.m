function upper_bin = get_upper_fft_bin(f, Fs, N)
    %given a frequency, find the FFT bin.
    %This time, don't add N/2 because we have already discarded the
    %mirrored component.
    %must add 1
    upper_bin = (f * N / Fs) + 1;
end