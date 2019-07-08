%read and plot maybe?
close all; clear; clc;

gran = 100;
dx = 1/gran;
ultimatename = ['results/solution_loc1.csv'];
X = csvread(ultimatename);
ultimatename = ['results/solution_loc2.csv'];
Y = csvread(ultimatename);
ultimatename = ['results/solution_loc3.csv'];
Z = csvread(ultimatename);


%plot location frequency drift aggregate.
%Location 1
plot_each_parzen(X(:,3), X(:,2)/sum(X(:,2)), gran, 'Location 1 Aggregate Frequency Distribution', 'Frequency', 'Hz');
plot_each_near_zero_pdf(X(:,3), X(:,2)/sum(X(:,2)), gran, 'Location 1 Small Frequency Contributions', 'Frequency', 'Hz', 0);
plot_each_nonzero_pdf(X(:,3), X(:,2)/sum(X(:,2)), gran, 'Location 1 Large Frequency Contributions', 'Frequency', 'Hz', 1);
%plot just transmission 1.
plot_pdf(X(1:100,3), X(1:100,2)/sum(X(1:100,2)), gran,'Location 1 Transmission 1 Frequency Contributions', 'Frequency', 'Hz');
%plot just transmission 6.
plot_pdf(X(501:600,3), X(501:600,2)/sum(X(501:600,2)), gran,'Location 1 Transmission 6 Frequency Contributions', 'Frequency', 'Hz');
%plot just transmission 10.
plot_pdf(X(901:1000,3), X(901:1000,2)/sum(X(901:1000,2)), gran,'Location 1 Transmission 10 Frequency Contributions', 'Frequency', 'Hz');
%Location 2
plot_each_parzen(Y(:,3), Y(:,2)/sum(Y(:,2)), gran, 'Location 2 Aggregate Frequency Distribution', 'Frequency', 'Hz');
plot_each_near_zero_pdf(Y(:,3), Y(:,2)/sum(Y(:,2)), gran, 'Location 2 Small Frequency Contributions', 'Frequency', 'Hz', 0);
plot_each_nonzero_pdf(Y(:,3), Y(:,2)/sum(Y(:,2)), gran, 'Location 2 Large Frequency Contributions', 'Frequency', 'Hz', 1);
%Location 3
plot_each_parzen(Z(:,3), Z(:,2)/sum(Z(:,2)), gran, 'Location 3 Aggregate Frequency Distribution', 'Frequency', 'Hz');
plot_each_near_zero_pdf(Z(:,3), Z(:,2)/sum(Z(:,2)), gran, 'Location 3 Small Frequency Contributions', 'Frequency', 'Hz', 0);
plot_each_nonzero_pdf(Z(:,3), Z(:,2)/sum(Z(:,2)), gran, 'Location 3 Large Frequency Contributions', 'Frequency', 'Hz', 1);

%Due to the extreme disparities between signals the all plotter is not very
%useful.
% A = [X(:,3) Y(:,3) Z(:,3)];
% B = [X(:,2)/sum(X(:,2)) Y(:,2)/sum(Y(:,2)) Z(:,2)/sum(Z(:,2))];
% the_all_plotter(A, B, gran, 'Aggregate Frequency Distribution', 'Frequency', 'Hz')

%plot location magnitude aggregate.
%Location 1
plot_each_parzen(X(:,7), X(:,6)/sum(X(:,6)), gran, 'Location 1 Aggregate Magnitude Distribution','Magnitude', 'dBmPa');
plot_each_near_zero_pdf(X(:,7), X(:,6)/sum(X(:,6)), gran, 'Location 1 Small Magnitude Contributions', 'Magnitude', 'dBmPa', 0);
plot_each_nonzero_pdf(X(:,7), X(:,6)/sum(X(:,6)), gran, 'Location 1 Large Magnitude Contributions', 'Magnitude', 'dBmPa', 1);
%plot just transmission 1.
plot_pdf(X(1:100,7), X(1:100,6)/sum(X(1:100,6)), gran,'Location 1 Transmission 1 Magnitude Contributions', 'Magnitude', 'dBmPa');
%plot just transmission 6.
plot_pdf(X(501:600,7), X(501:600,6)/sum(X(501:600,6)), gran,'Location 1 Transmission 6 Magnitude Contributions', 'Magnitude', 'dBmPa');
%plot just transmission 10.
plot_pdf(X(901:1000,7), X(901:1000,6)/sum(X(901:1000,6)), gran,'Location 1 Transmission 10 Magnitude Contributions', 'Magnitude', 'dBmPa');
%Location 2
plot_each_parzen(Y(:,7), Y(:,6)/sum(Y(:,6)), gran, 'Location 2 Aggregate Magnitude Distribution','Magnitude', 'dBmPa');
plot_each_near_zero_pdf(Y(:,7), Y(:,6)/sum(Y(:,6)), gran, 'Location 2 Small Magnitude Contributions', 'Magnitude', 'dBmPa', 0);
plot_each_nonzero_pdf(Y(:,7), Y(:,6)/sum(Y(:,6)), gran, 'Location 2 Large Magnitude Contributions', 'Magnitude', 'dBmPa', 1);
%location 3
plot_each_parzen(Z(:,7), Z(:,6)/sum(Z(:,6)), gran, 'Location 3 Aggregate Magnitude Distribution','Magnitude', 'dBmPa');
plot_each_near_zero_pdf(Z(:,7), Z(:,6)/sum(Z(:,6)), gran, 'Location 2 Small Magnitude Contributions', 'Magnitude', 'dBmPa', 0);
plot_each_nonzero_pdf(Z(:,7), Z(:,6)/sum(Z(:,6)), gran, 'Location 2 Large Magnitude Contributions', 'Magnitude', 'dBmPa', 1);

% A = [X(:,7) Y(:,7) Z(:,7)];
% B = [X(:,6)/sum(X(:,6)) Y(:,6)/sum(Y(:,6)) Z(:,6)/sum(Z(:,6))];
% the_all_plotter(A, B, gran, 'Aggregate Magnitude Distribution', 'Magnitude' ,'dBmPa')

%plot location dc bias aggregate.
plot_each_parzen(X(:,11), X(:,10)/sum(X(:,10)), gran, 'Location 1 Aggregate DC Bias Distribution','Magnitude', 'dBmPa');
plot_each_parzen(Y(:,11), Y(:,10)/sum(Y(:,10)), gran, 'Location 2 Aggregate DC Bias Distribution','Magnitude', 'dBmPa');
plot_each_parzen(Z(:,11), Z(:,10)/sum(Z(:,10)), gran, 'Location 3 Aggregate DC Bias Distribution','Magnitude', 'dBmPa');

% A = [X(:,11) Y(:,11) Z(:,11)];
% B = [X(:,10)/sum(X(:,10)) Y(:,10)/sum(Y(:,10)) Z(:,10)/sum(Z(:,10))];
% the_all_plotter(A, B, gran, 'Aggregate DC Bias Distribution', 'Magnitude', 'dBmPa')