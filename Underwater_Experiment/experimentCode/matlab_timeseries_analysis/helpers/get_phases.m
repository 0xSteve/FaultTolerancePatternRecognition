function [phase_vec] = get_phases(X, tolerance)
    % The purpose of this function is to just aggregate phase angles given
    % a complex vector of FFTs.
    
     if(~exist('tolerance','var'))
        tolerance = 10000;
    end
    %Phase is the sqrt: /_X[f] = arctan(Xim/Xre)
    if(~iscell(X))
        fprintf('Use a cell.');
    else
        phase_vec = [];
        for li = 1:length(X)
            %tolerance threshold.
            X1 = X{li}(:,1) + X{li}(:,2)*i;
            X2 = X1;
            threshold = max(abs(X1))/tolerance;
            %The following line cleans out rounding errors.
            X2(abs(X1)<threshold) = 0; %X2 is cell_vec.
            phase = atan2(imag(X2),real(X2))*180/pi;
            phase_vec = [phase_vec phase];
        end
    end
end