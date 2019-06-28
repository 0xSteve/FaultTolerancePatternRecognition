function mags = get_upper_mags(X, N)
    Fn = N/2;
     if(~iscell(X))
        mags = sqrt(X(:,1).^2 + X(:,2).^2);
    else
        mags = [];
        for li = 1 : length(X)
            ub = length(X{li}); %upper bound.
            mag = sqrt(X{li}((Fn+1):ub,1).^2 + X{li}((Fn+1):ub,2).^2);
            mags = [mags mag];
        end
    end
end