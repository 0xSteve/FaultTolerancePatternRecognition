function f = get_f2(X, Fs, N)
    %
    Fn = N/2;
    bins = get_bin_at_max2(X, N);
%     bins = bins + Fn;
    f = bins .* Fs / N;
end