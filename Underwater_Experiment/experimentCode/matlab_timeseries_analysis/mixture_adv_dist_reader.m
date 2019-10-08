close all; clear; clc;

max_trans = 100;
gran = 1000;
Z = csvread(['theoretic_results/mixture_res30x' num2str(max_trans) '_sln.csv']);
W = csvread(['theoretic_results/mixture_res30x' num2str(max_trans) '.csv']);
Y = zeros(gran,1);
X = linspace(-3.25,10.25,gran);
% A = linspace(-3.25,3.25,gran);
B = linspace(4,5,gran);
W = 0.5*pdf('Normal',X, 0, 1);
%V = 0.5 * pdf('Uniform',X,4,5);
V = 0.5*pdf('Normal',X, 4, 3);
%W = W / sum(W);
h = zeros(3, 1);
figure;
for li=1:max_trans
    hold on;
    %Z(:,li) = Z(:,li) / sum(Z(:,li));
    h(3) = plot(X, Z(:,li),'--k', 'DisplayName', ['Incomplete  ' 'Estimates']);
    Y = Y + Z(:,li);
end
Y = Y / max_trans;

h(1) = plot(X, Y,'r','LineWidth', 2, 'DisplayName', ['Signature ' 'Distribution'])
%plot(X, W, 'Color', [0.502, 0.6706, 0.1529], 'LineWidth', 4)
h(2) = plot(X, (W + V), 'b', 'LineWidth', 2, 'DisplayName', ['Oracle ' 'Distribution'])
%h(2) = plot(X, V, 'b', 'LineWidth', 4, 'DisplayName', ['Oracle' newline 'Distribution'])
% plot(B, V, 'b', 'LineWidth', 4, 'DisplayName', ['Oracle' newline 'Distribution'])
hold off;
xlabel('$x$','Interpreter','latex')
ylabel('$p(x)$', 'Interpreter','latex')
legend(h(1:3));
D = KLD((W+V), Y)
%For 
