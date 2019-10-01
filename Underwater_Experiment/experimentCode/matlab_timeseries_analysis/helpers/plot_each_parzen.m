function plot_each_parzen(X,Y, len, muh_title, dim_title, unit, has_legend)

     if (~exist('muh_title', 'var'))
        muh_title = 'x';
     end
    if (~exist('dim_title', 'var'))
        dim_title = 'x';
    end
    if (~exist('has_legend', 'var'))
        has_legend = 0;
    end
   start = 1;
    stop = len;
    figure
    hold on
    legend_string = {};
    for li=1:10
        disp(X(start:stop));
        stem(X(start:stop),Y(start:stop));
        start = stop;
        stop = stop + len - 1;
        legend_string(end + 1) = {['Transmission ' num2str(li)]};
    end
    title(muh_title)
    xlabel([dim_title ' (' unit ')'])
    if(has_legend)
        legend(legend_string, 'Location', 'northeast')
    end
    ylabel(['P(' dim_title ')'])
    xlim([0 1300])
    hold off
end