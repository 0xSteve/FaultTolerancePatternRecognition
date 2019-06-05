function f_vec = get_f_at_max(fft_vec, Fs, N)
    % Get the vector of frequency values at the maximum signal strength.
    % Frequency is not scaled!
    Fmax = Fs / 2;
	Fn = N / 2;
	delta_f = Fmax / Fn;
    fr = (0:(Fn-1))';
    %not scaled to kHz
	fr = (fr * delta_f);
    f_vec = [];
    for i = 1:length(fft_vec(1,:))
       [a, index] = max(fft_vec(:,i));
       f_vec = [f_vec fr(index)];
    end
    f_vec = f_vec';
end