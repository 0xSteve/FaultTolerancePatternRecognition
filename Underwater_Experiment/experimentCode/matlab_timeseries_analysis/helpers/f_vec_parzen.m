function f_vec = f_vec_parzen(fname, Fs, N, max_len)
    X = csvread(fname);
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
end