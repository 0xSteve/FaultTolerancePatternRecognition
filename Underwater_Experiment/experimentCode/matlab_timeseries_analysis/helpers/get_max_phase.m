function max_phase_vec = get_max_phase(cell_vec, tolerance)
    
    if(~exist('tolerance','var'))
        tolerance = 10000;
    end
    
    max_phase_vec = [];
    for i = 1:length(cell_vec)
        %tolerance threshold.
        threshold = max(abs(cell_vec{i}))/tolerance;
        %The following line cleans out rounding errors.
        X2 = cell_vec{i};
        X2(abs(cell_vec{i})<threshold) = 0; %X2 is cell_vec.
        max_phase = max(atan2(X2(:,2),X2(:,1))*180/pi);
        max_phase_vec= [max_phase_vec; max_phase];
    end
end