function pdf = average_pdf(X, len)
    
    start = 1;
    stop = len;
    Y = [];
    for li=1:10
        Y = [Y X(start:stop)];
        start = stop;
        stop = stop + len - 1;
    end
     Y = Y';
    pdf = sum(Y);
end