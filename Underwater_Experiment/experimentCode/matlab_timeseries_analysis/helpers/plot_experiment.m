function [X,S] = plot_experiment(X, Y, granularity, xaxis_title,loc)
    %Alright, the format could be so much better, but isn't.
    %so each vector has a granularity. Each transmission happens
    %once every granularity.
    
    start = 1;
    stop = granularity;
    max_trans = length(X) / granularity;
    S = zeros(granularity, 1);
    figure;
    hold on;
    while stop < length(Y)
         plot(X(1:1000), Y(start:stop),'--k');
         S = S + Y(start:stop);
         start = stop + 1;
         stop = stop + granularity;
    end
    S = S/max_trans;
    sum(S)
    h(1) = plot(X(1:1000), S,'r','LineWidth', 2, 'DisplayName', ['Signature' newline 'Distribution']);
    hold off;
    xlabel(['$x$'],'Interpreter','latex');
    ylabel(['$p^{' num2str(loc) '}_{' xaxis_title '}(x)$'], 'Interpreter','latex');
    legend(h(1));
    X = X(1:1000);
end
