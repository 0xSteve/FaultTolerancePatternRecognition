close all; clear; clc;

max_trans = 1000;

Z = csvread(['theoretic_results/res31x' num2str(max_trans) '_sln.csv']);
Y = zeros(1000,1);
X = linspace(-3.25,3.25,1000);
W = normpdf(X,0,1);
h = zeros(2, 1);
figure;
for li=1:max_trans
    hold on;
    plot(X, Z(:,li),'--k')
    Y = Y + Z(:,li);
end
Y = Y / max_trans;

h(1) = plot(X, Y,'r','LineWidth', 4, 'DisplayName', ['Boosted' newline 'Parzen'])
%plot(X, W, 'Color', [0.502, 0.6706, 0.1529], 'LineWidth', 4)
h(2) = plot(X, W, 'b', 'LineWidth', 4, 'DisplayName', ['Oracle' newline 'Distribution'])
hold off;
xlabel('$x$','Interpreter','latex')
ylabel('$p(x)$', 'Interpreter','latex')
legend(h(1:2));
