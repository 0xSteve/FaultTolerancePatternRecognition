function [fft, fr] = get_upper_fft(vec, Fs, N)
% Get only the upper portion of the FFT of a given raw data vector, and 
%return an array of FFTs, and frequency intervals. This way only the
%non-mirrored portion is returned.
	Fmax = Fs / 2;
	Fn = N / 2;
	delta_f = Fmax / Fn;
	segment = Fn + 1;
	fft = [];
	next_segment = N; %might be N, might be N+1
	while next_segment < length(vec)
		nfft = vec(segment:next_segment);
		fft = [fft nfft];
		segment = next_segment + (1 + Fn);
		next_segment = next_segment + N;
	end
	fr = (0:(Fn-1))';
    %scale to kHz
	fr = (fr * delta_f)/1000;
end