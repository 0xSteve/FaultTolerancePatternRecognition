function the_all_plotter(X, Y, len, the_title, datum, unit)

    figure
    hold on
    for li=1:length(Y(1,:))
        pdf = average_pdf(Y(:,li), len);
        threshold = max(abs(pdf))/10000; %tolerance threshold

        minimum = min(X(:,li));
        maximum = max(X(:,li));
        X = linspace(minimum, maximum, len);
        stem(X, pdf)
    end
    title(the_title)
    xlabel([datum ' (' unit ')' ])
    ylabel(['P(' datum ')'])
    hold off

end