%plot the KLD log
close all; clear; clc;
%Event, Time, D_{KL}
Events = [1,5,10,20,50,100,500,1000,5000];
Time = [30,150, 300, 600, 150000, 300000, 1500000, 3000000,15000000]; 
%first time is 30k.
D = [31.0658,14.587,14.1187,14.7919,14.1345,13.8735,13.1639,13.429,13.2487];

figure
[hAx,hLine1,hLine2] = plotyy(Events, D,Events, Time);
title('Divergence & Time Complexity');
xlabel('Number of Receptions');
hLine1.LineWidth = 2;
hLine2.LineWidth = 2;
ylabel(hAx(1),'Divergence') % left y-axis 
ylabel(hAx(2),'Time Complexity'); % right y-axis