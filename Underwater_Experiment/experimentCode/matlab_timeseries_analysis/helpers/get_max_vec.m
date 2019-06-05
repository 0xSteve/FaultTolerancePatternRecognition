function max_vec = get_max_vec(fft_vec)
    % Get the maximum value for each sample in an fft body.
    max_vec = [];
    for i = 1:length(fft_vec(1,:))
       [max_val, a] = max(fft_vec(:,i));
       max_vec = [max_vec max_val];
    end
    max_vec = max_vec';
end