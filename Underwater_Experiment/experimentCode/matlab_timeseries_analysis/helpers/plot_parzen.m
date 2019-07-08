function plot_parzen(X, Y, len,  muh_title, dim_title,unit)

    %close existing figures so it's cleaned up.
%     close all;
    if (~exist('muh_title', 'var'))
        muh_datum = 'x';
    end
    pdf = average_pdf(Y, len);
    minimum = min(X);
    maximum = max(X);
    X = linspace(minimum, maximum, len);
    figure
    stem(X, pdf)
    title(muh_title)
    ylabel(['P(' dim_title ')'])
    xlabel([dim_title ' (' unit ')']) 
end