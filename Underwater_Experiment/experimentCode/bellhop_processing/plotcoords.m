%clear it up.
close all; clear; clc;
 
%This is a script to plot the GPS coordinates.
r = [44.783413, 78.050114];
s1 = [44.783445, 78.05001];
s2 = [44.783441,78.050114];
s3 = [44.783454,78.050015];
figure
hold on
p = scatter(44.783413, 78.050114, [], 'red', 'filled');
text(44.783412, 78.050112, 'Receiver');
p1 = scatter(44.783445, 78.05001, [], 'blue', 'filled');
text(44.783445, 78.050009, 'Send Location 1');
p2 = scatter(44.783441,78.050114, [], 'blue', 'filled');
text(44.783439,78.050112, 'Send Location 2');
p3 = scatter(44.783454,78.050015, [], 'blue', 'filled');
text(44.783445485,78.050015, 'Send Location 3');
title('Sensor Positions');
xlabel('Latitude');
ylabel('Longitude');

%RELATIVE POSITION WITH RESPECT TO THE RECEIVER

rel1 = [(r(1) - s1(1)), (r(2) -s1(2))];
rel2 = [(r(1) - s2(1)), (r(2) -s2(2))];
rel3 = [(r(1) - s3(1)), (r(2) -s3(2))];
rel = [rel1;rel2;rel3];
rel = [r;s1;s2;s3]


%map to [-1,1]
mi = min(rel(:,1));
ma = max(rel(:,1));
slp = 1.0 * 2/(ma - mi);
rel(:,1) = slp * (rel(:,1)-mi) - 1;
mi = min(rel(:,2));
ma = max(rel(:,2));
slp = 2/(ma - mi);
rel(:,2) = slp * (rel(:,2)-mi) - 1;
figure
hold on
sz = 45;
p = scatter(rel(1,1),rel(1,2), sz, 'red', 'filled');
set(gca, 'FontName', 'Times New Roman');
text(rel(1,1),rel(1,2), 'Receiver','VerticalAlignment','top','HorizontalAlignment','left');
p1 = scatter(rel(2,1), rel(2,2), sz, 'blue', 'filled');
text(rel(2,1), rel(2,2), 'Send Location 1','VerticalAlignment','top','HorizontalAlignment','right');
p2 = scatter(rel(3,1), rel(3,2), sz, 'blue', 'filled');
text(rel(3,1), rel(3,2), 'Send Location 2','VerticalAlignment','top','HorizontalAlignment','left');
p3 = scatter(rel(4,1), rel(4,2), sz, 'blue', 'filled');
text(rel(4,1), rel(4,2), 'Send Location 3','VerticalAlignment','bottom','HorizontalAlignment','right');
%title('Sensor Positions');
xlabel('Normalized Latitude');
ylabel('Normalized Longitude');
xlim([-1.1 1.1]);
ylim([-1.1 1.1]);