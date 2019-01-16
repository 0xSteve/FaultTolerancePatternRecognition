%The purpose of this script is to take a time window between 0 and 2.5
%seconds of each transmission sent from send location 2 and generate
%figures for that time window from the wav file. In addition, it will apply
%a n-order boxcar filter to that time-series and generate some plots of
%those signals.

%Clean up the environment.
close all; clear; clc;

time = [];
order = 3; %set the order of the boxcar filter.
%note that without the native option passed to audioread, it will give a
% output for the signal, where y(:,1) is the time series of the
%signal and Fs is the number of samples.
[y1, Fs] = audioread(["sendloc1_trans"+1+ "_laketrial_aug13_2018.wav"]);
[y2, Fs] = audioread(["sendloc1_trans"+2+ "_laketrial_aug13_2018.wav"]);
[y3, Fs] = audioread(["sendloc1_trans"+3+ "_laketrial_aug13_2018.wav"]);
[y4, Fs] = audioread(["sendloc1_trans"+4+ "_laketrial_aug13_2018.wav"]);
[y5, Fs] = audioread(["sendloc1_trans"+5+ "_laketrial_aug13_2018.wav"]);
% [y6, Fs] = audioread(["sendloc2_trans"+6+ "_laketrial_aug13_2018.wav"]);
% [y7, Fs] = audioread(["sendloc2_trans"+7+ "_laketrial_aug13_2018.wav"]);

%clean the time series
y1 = y1(:,1);
len_y = length(y1);
%create the time in units.
for i=1:(len_y-1)
    time = [time i/Fs];
end
%For a diagram we can 
t_1 = floor(1.500 * Fs);
t_2 = ceil(1.502 * Fs);

%plot the time
figure;
% xmission 1
subplot(5,1,1);
hold on;
plot(time(t_1:t_2), y1(t_1:t_2),'k');
stem(time(t_1:t_2), y1(t_1:t_2),'k', 'fill');
hold off;
axis([time(t_1) time(t_2) min(y1(t_1:t_2)) max(y1(t_1:t_2))])
xlabel('Time (s)')
ylabel('Amplitude')
title('Transmission Event 1')
% xmission 2
subplot(5,1,2);
hold on;
plot(time(t_1:t_2), y2(t_1:t_2),'k');
stem(time(t_1:t_2), y2(t_1:t_2),'k', 'fill');
hold off;
axis([time(t_1) time(t_2) min(y2(t_1:t_2)) max(y2(t_1:t_2))])
xlabel('Time (s)')
ylabel('Amplitude')
title('Transmission Event 2')
% xmission 3
subplot(5,1,3);
hold on;
plot(time(t_1:t_2), y3(t_1:t_2),'k');
stem(time(t_1:t_2), y3(t_1:t_2),'k', 'fill');
hold off;
axis([time(t_1) time(t_2) min(y3(t_1:t_2)) max(y3(t_1:t_2))])
xlabel('Time (s)')
ylabel('Amplitude')
title('Transmission Event 3')
% xmission 4
subplot(5,1,4);
hold on;
plot(time(t_1:t_2), y4(t_1:t_2),'k');
stem(time(t_1:t_2), y4(t_1:t_2),'k', 'fill');
hold off;
axis([time(t_1) time(t_2) min(y4(t_1:t_2)) max(y4(t_1:t_2))])
xlabel('Time (s)')
ylabel('Amplitude')
title('Transmission Event 4')
% xmission 5
subplot(5,1,5);
hold on;
plot(time(t_1:t_2), y5(t_1:t_2),'k');
stem(time(t_1:t_2), y5(t_1:t_2),'k', 'fill');
hold off;
axis([time(t_1) time(t_2) min(y5(t_1:t_2)) max(y5(t_1:t_2))])
xlabel('Time (s)')
ylabel('Amplitude')
title('Transmission Event 5')