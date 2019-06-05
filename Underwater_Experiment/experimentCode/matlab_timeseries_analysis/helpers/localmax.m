function [M, Indexes] = localmax(X, lower_bound, upper_bound)
%Given a vector, find local maxima on an interval, and return index.
    index_range = lower_bound:upper_bound;
    muh_range = length(index_range)
    maxi = [];
    index = [];
    for i=lower_bound:muh_range:length(X)
        [a,b] = max(X(index_range));
        maxi = [maxi a];
        index = [index (b + lower_bound - 1)];
        lower_bound = lower_bound + muh_range;
        upper_bound = upper_bound + muh_range;
        index_range = lower_bound:upper_bound;
    end
    maxi = maxi';
    index = index';
    M = maxi;
    Indexes = index;
end