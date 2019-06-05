function [M, Indexes] = localmin(X, lower_bound, upper_bound)
%Find local minima
    index_range = lower_bound:upper_bound;
    muh_range = length(index_range)
    mini = [];
    index = [];
    for i=lower_bound:muh_range:length(X)
        [a,b] = min(X(index_range));
        mini = [mini a];
        index = [index (b + lower_bound - 1)];
        lower_bound = lower_bound + muh_range;
        upper_bound = upper_bound + muh_range;
        index_range = lower_bound:upper_bound;
    end
    mini = mini';
    index = index';
    M = mini;
    Indexes = index;
end