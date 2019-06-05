function [fft, fr] = get_upper_fft2(vec, Fs, N)
% Get the FFT of a given raw data vector, and return an array of FFTs, and
% frequency intervals.
	Fmax = Fs / 2;
	Fn = N / 2;
	delta_f = Fmax / Fn;
	segment = Fn + 1;
    i = 1;
	next_segment = N;
	while next_segment < length(vec(:,1))
		nfft = vec(segment:next_segment,:);
		fft{i} = nfft;
		segment = next_segment;
		next_segment = next_segment + N;
        i = i + 1;
	end
	fr = ((-Fn):(Fn))';
	fr = (fr * delta_f)/1000;
end