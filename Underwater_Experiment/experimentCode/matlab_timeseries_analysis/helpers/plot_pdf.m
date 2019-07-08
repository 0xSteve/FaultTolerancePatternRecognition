function plot_pdf(X, Y, len,  muh_title, dim_title,unit)

    %close existing figures so it's cleaned up.
%     close all;
    if (~exist('muh_title', 'var'))
        muh_datum = 'x';
    end
    figure
    stem(X, Y)
    title(muh_title)
    ylabel(['P(' dim_title ')'])
    xlabel([dim_title ' (' unit ')']) 
end