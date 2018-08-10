function [] = plot_thermocline(array, name, directory, title_name)
    full_path = [directory '/' name];
    
    % The 6th column gives depth relative to the bottom.
    % col6 * 5 + 5 for total depth.
    % First average the AINS.
    count = 0;
    depths = 0;
    last = -1;
    for i=1:length(array(:,6))
        if array(i,6) ~= last;
            count = count + 5;
            depths = depths + 1;
            last = array(i,6);
        end
    end
    C = [];
    B = 0;
    last = -1;
    row = 1
    last_row = 1
    for depth = 0:(depths - 1)
        row = last_row;
        for col = 1:5
            counter = 0;
            B = 0;
            row = last_row;
        while(row <= length(array(:,1)))
            if(array(row, 6) ~= depth)
                break;
            end
            B = B + array(row, col);
            counter = counter + 1;
            row = row + 1;
        end
        B = B / counter;
        C = [C B];
        end
        last_row = row;
    end
    figure;
    plot(C, 1:1:(count))
    title(title_name)
    xlabel('Temperature (C)');
    ylabel('Depth (m)');
    axis([min(C) max(C) 1 count])
    
end