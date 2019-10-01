function D = KLD(P, Q)
%P is the oracle distribution. 
%Q is the estimated distribution.
%Both distributions must be the same length.
%Given P and Q, the log divergence of entropy is returned in D.
D = 0;
for li = 1:length(Q)
    a = P(li) / Q(li);
    if a > 0
        a = log(a);
    else
        a = 0;
    end
    a = a * P(li);
    D = D + a;
end
%
end