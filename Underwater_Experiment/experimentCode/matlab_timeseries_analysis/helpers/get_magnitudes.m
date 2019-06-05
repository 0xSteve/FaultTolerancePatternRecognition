function mag_vec = get_magnitudes(X)
    % The purpose of this function is to just aggregate magnitudes given a
    % complex vector of FFTs.
    
    %Magnitude is the sqrt: |X[f]| = (re^2 + im^2)^.5
    if(~iscell(X))
        mag_vec = sqrt(X(:,1).^2 + X(:,2).^2);
    else
        mag_vec = [];
        for i = 1 : length(X)
            magnitude = sqrt(X{i}(:,1).^2 + X{i}(:,2).^2);
            mag_vec = [mag_vec magnitude];
        end
    end
end