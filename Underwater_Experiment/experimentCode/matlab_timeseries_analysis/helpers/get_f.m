function f = get_f(bin, Fs, N)
    Fn = N / 2;
    if( bin > Fn)
        bin = bin - Fn;
    else
        bin = Fn - bin;
    end
    f = bin * Fs / N;
end