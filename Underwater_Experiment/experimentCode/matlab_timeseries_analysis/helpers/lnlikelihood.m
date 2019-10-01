function l = lnlikelihood(X, len)
    %len is the granularity
    a = min(X);
    b = max(X);
    dx = 1 / len;
    l = linspace(a, b, len)';
    l = zeros(len,1);
    start = 1;
    stop = len;
    %assume 10 transmissions...
    for li=1:10
        l = l + log(X(start:stop));
%         disp(sum(X(start:stop)));
        start = stop+1;
        stop = stop + len;
    end
    l = exp(l);
    if (sum(l) <= 0.98 || sum(l) >= 1.02)
        %not close enough to 1.
        %This is not a convex combination. Throw error.
        %disp('ERROR: L is not a convex combination!');
    end
end