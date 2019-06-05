function [y] = boxcar_fir(ts, N)
%ts is the time series
%N is the order
y = [];
for i=N:length(ts-N-1)
    y = [y (sum(ts((i-N+1):i))/N)];
end