function [fft, fr] = get_fft(vec, Fs, N)
% Get the FFT of a given raw data vector, and return an array of FFTs, and
% frequency intervals.
	Fmax = Fs / 2;
	Fn = N / 2;
	delta_f = Fmax / Fn;
	segment = 1;
	fft = [];
	next_segment = segment + N;
	while next_segment < length(vec)
		nfft = vec(segment:next_segment);
		fft = [fft nfft];
		segment = next_segment;
		next_segment = next_segment + N;
	end
	fr = ((-Fn):(Fn))';
	fr = (fr * delta_f)/1000;
end
