function maxes = get_max(mags)
    %
    maxes = [];
    for li = 1: length(mags(1,:))
        [a, b] = max(mags(:,li));
        maxes = [maxes; a];
    end
end