function [L, X] = plot_parzen(X, Y, len,  muh_title, dim_title,unit)

    %close existing figures so it's cleaned up.
    %close all;
    if (~exist('muh_title', 'var'))
        muh_datum = 'x';
    end
    %L = average_pdf(Y, len);
    L = lnlikelihood(Y, len);
    minimum = min(X);
    maximum = max(X);
    X = linspace(minimum, maximum, len);
    X = X(1:len);
    figure
    stem(X, L,'k', 'filled')
    title(muh_title)
    ylabel(['P(' dim_title ')'])
    xlabel([dim_title ' (' unit ')']) 
end