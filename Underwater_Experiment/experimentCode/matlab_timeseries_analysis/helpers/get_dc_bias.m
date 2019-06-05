function dc_vec = get_dc_bias(fft_vec)
    % Get the vector of DC biases.
    dc_vec = [];
    for i = 1:length(fft_vec(1,:))
       dc_vec = [dc_vec fft_vec(1,i)];
    end
    dc_vec = dc_vec';
end