function plot_eacah_nonzero_pdf(X,Y, len, muh_title, dim_title,unit,has_legend,threshold)

     if (~exist('muh_title', 'var'))
        muh_title = 'x';
     end
    if (~exist('dim_title', 'var'))
        dim_title = 'x';
    end
    if (~exist('has_legend', 'var'))
        has_legend = 0;
    end
    if (~exist('threshold', 'var'))
        threshold = 1E-3;
    end
    start = 1;
    stop = len;
    figure
    hold on
    legend_string = {};
    for li=1:10
        A = X(start:stop);
        B = Y(start:stop);
        B2 = B;
        B2(abs(B)>threshold) = 0;
        [A,B] = get_nonzero_pts(A,B2);
        stem(A,B);
        start = stop;
        stop = stop + len - 1;
        if(max(B) > 0)
            legend_string(end + 1) = {['Transmission ' num2str(li)]};
        end
    end
    title(muh_title)
    xlabel([dim_title ' (' unit ')'])
    if(has_legend)
        legend(legend_string, 'Location', 'northeast')
    end
    ylabel(['P(' dim_title ')'])
    hold off
end