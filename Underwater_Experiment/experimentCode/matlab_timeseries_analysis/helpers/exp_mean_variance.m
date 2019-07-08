function [mean, variance] = exp_mean_variance(M, V, len, numtransmissions, Fc)
     
    if (~exist('numtransmissions', 'var'))
        numtransmissions = 10;
    end
    if (~exist('len', 'var'))
        len = 1000;
    end
    if (~exist('Fc', 'var'))
        Fc = 1200;
    end
    Y = [];
    Z = [];
    start = 1;
    stop = len;
     for li=1:numtransmissions
        Y = [Y M(start)];
        Z = [Z V(start)];
        start = stop;
        stop = stop + len - 1;
     end
    Y = Y';
    Z = Z';
    mean = sum(Y) / numtransmissions;
    variance = sum(Z) / (numtransmissions * Fc);
end