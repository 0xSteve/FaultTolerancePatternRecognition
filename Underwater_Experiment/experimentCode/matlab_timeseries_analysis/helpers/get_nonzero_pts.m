function [A,B] = get_nonzero_pts(X, Y)
    Indices = find(Y);
    len = length(X);
    A = [];
    B = [];
    for li = Indices
        A = [A; X(li)];
        B = [B; Y(li)];
    end
end