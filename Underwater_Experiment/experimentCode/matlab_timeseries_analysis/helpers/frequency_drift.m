function drift = frequency_drift(f_at_max_vec, f_c)
%given a PSD of a signal find the frequency of the max of a signal.
drift = abs(f_at_max_vec - f_c);
end