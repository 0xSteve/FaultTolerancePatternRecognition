function L = likelihood(X, len)
    %len is the granularity
    a = min(X);
    b = max(X);
    dx = 1 / len;
    L = linspace(a, b, len)';
    L = zeros(len,1);
    start = 1;
    stop = len;
    %assume 10 transmissions...
    for li=1:10
        L = L + (X(start:stop));
%         disp(sum(X(start:stop)));
        start = stop+1;
        stop = stop + len;
    end
   L = L/10;
    if (sum(L) <= 0.98 || sum(L) >= 1.02)
        %not close enough to 1.
        %This is not a convex combination. Throw error.
        %disp('ERROR: L is not a convex combination!');
    end
end