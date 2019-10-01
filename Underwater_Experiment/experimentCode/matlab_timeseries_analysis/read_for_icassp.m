%read and plot maybe?
close all; clear; clc;

%set(0,'DefaultAxesFontName', 'Times New Roman')
%set(0,'DefaultAxesFontSize', 16)

gran = 1000;
dx = 1/gran;
ultimatename = ['results/solution_loc1.csv'];
X = csvread(ultimatename);
ultimatename = ['results/solution_loc2.csv'];
Y = csvread(ultimatename);
ultimatename = ['results/solution_loc3.csv'];
Z = csvread(ultimatename);

[A,S1f] = plot_experiment(X(:,3), X(:,2), gran, 'f', 1);
[A,S2f] = plot_experiment(Y(:,3), Y(:,2), gran, 'f', 2);
[A,S3f] = plot_experiment(Z(:,3), Z(:,2), gran, 'f', 3);
figure;
hold on;
h(1) = plot(A,S1f, 'DisplayName', 'Location 1');
h(2) = plot(A,S2f, 'DisplayName', 'Location 2');
h(3) = plot(A,S3f, 'DisplayName', 'Location 3');
hold off;
ylabel('$p_f(x)$','Interpreter','latex');
xlabel('$x$','Interpreter','latex');
legend(h(1:3));
% 
[B,S1m] = plot_experiment(X(:,7), X(:,6), gran, 'P', 1);
[B,S2m] = plot_experiment(Y(:,7), Y(:,6), gran, 'P', 2);
[B,S3m] = plot_experiment(Z(:,7), Z(:,6), gran, 'P', 3);
figure;
hold on;
h(1) = plot(B,S1m, 'DisplayName', 'Location 1');
h(2) = plot(B,S2m, 'DisplayName', 'Location 2');
h(3) = plot(B,S3m, 'DisplayName', 'Location 3');
hold off;
ylabel('$p_P(x)$','Interpreter','latex');
xlabel('$x$','Interpreter','latex');
legend(h(1:3));
%
% [C,S1dcb] = plot_experiment(X(:,11), X(:,10), gran, 'dBmA', 1);
% [C,S2dcb] = plot_experiment(Y(:,11), Y(:,10), gran, 'dBmA', 2);
% [C,S3dcb] = plot_experiment(Z(:,11), Z(:,10), gran, 'dBmA', 3);
%plot location frequency drift aggregate.
%Location 1
