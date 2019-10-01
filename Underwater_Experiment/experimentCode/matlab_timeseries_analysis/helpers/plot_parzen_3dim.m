function plot_parzen_3dim(X, muh_datum)
    %Given a Mx3 set of send location data columns, plot the Parzen pdf.
    
    %close existing figures so it's cleaned up.
    %close all;
%     if (~exist('muh_title', 'var'))
%         muh_title = 'no title PMF';
%     end
    if (~exist('muh_datum', 'var'))
        muh_datum = 'x';
    end
    %I can make this more complex to account for length of the vector and
    %center it at the mean etc. For now it will stay simple.
    
    figure
    hold on
    stem(X(:,1))
    stem(X(:,2))
    stem(X(:,3))
    title([muh_datum ' Aggregate'])
    ylabel(['P(' muh_datum ')'])
    xlabel(muh_datum)
    legend({'Location 1','Location 2', 'Location 3'},'Location','northeast')
    hold off
    %
    figure
    stem(X(:,1))
    title(['Location 1:' muh_datum])
    ylabel(['P(' muh_datum ')'])
    xlabel(muh_datum)
    %
    figure
    stem(X(:,2))
    title(['Location 2:' muh_datum])
    ylabel(['P(' muh_datum ')'])
    xlabel(muh_datum)
    %
    figure
    stem(X(:,3))
    title(['Location 3:' muh_datum])
    ylabel(['P(' muh_datum ')'])
    xlabel(muh_datum)
    %
end