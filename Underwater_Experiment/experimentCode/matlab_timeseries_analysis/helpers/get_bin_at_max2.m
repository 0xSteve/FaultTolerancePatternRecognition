function bins = get_bin_at_max2(X, N)
    %Gets the bin of the maximum magnitude vector, assumes upper bin only.
    mags = get_upper_mags(X, N);
    [a, bins] = max(mags);
    bins = bins';
end