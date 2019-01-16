close all; clear; clc;
[a1, Fs] = audioread(["sendloc1_trans"+1+ "_laketrial_aug13_2018.wav"]);
[a2, Fs] = audioread(["sendloc1_trans"+2+ "_laketrial_aug13_2018.wav"]);
[a3, Fs] = audioread(["sendloc1_trans"+3+ "_laketrial_aug13_2018.wav"]);
[a4, Fs] = audioread(["sendloc1_trans"+4+ "_laketrial_aug13_2018.wav"]);
[a5, Fs] = audioread(["sendloc1_trans"+5+ "_laketrial_aug13_2018.wav"]);
a1 = a1(:,1);
a2 = a2(:,1);
a3 = a3(:,1);
a4 = a4(:,1);
a5 = a5(:,1);
[acfa1, laga] = autocorr(a1);
acfa2 = autocorr(a2);
acfa3 = autocorr(a3);
acfa4 = autocorr(a4);
acfa5 = autocorr(a5);
%sendloc2
[b1, Fs] = audioread(["sendloc2_trans"+1+ "_laketrial_aug13_2018.wav"]);
[b2, Fs] = audioread(["sendloc2_trans"+2+ "_laketrial_aug13_2018.wav"]);
[b3, Fs] = audioread(["sendloc2_trans"+3+ "_laketrial_aug13_2018.wav"]);
[b4, Fs] = audioread(["sendloc2_trans"+4+ "_laketrial_aug13_2018.wav"]);
[b5, Fs] = audioread(["sendloc2_trans"+5+ "_laketrial_aug13_2018.wav"]);
b1 = b1(:,1);
b2 = b2(:,1);
b3 = b3(:,1);
b4 = b4(:,1);
b5 = b5(:,1);
[acfb1, lagb] = autocorr(b1);
acfb2 = autocorr(b2);
acfb3 = autocorr(b3);
acfb4 = autocorr(b4);
acfb5 = autocorr(b5);
%sendloc3
[c1, Fs] = audioread(["sendloc3_trans"+1+ "_laketrial_aug13_2018.wav"]);
[c2, Fs] = audioread(["sendloc3_trans"+2+ "_laketrial_aug13_2018.wav"]);
[c3, Fs] = audioread(["sendloc3_trans"+3+ "_laketrial_aug13_2018.wav"]);
[c4, Fs] = audioread(["sendloc3_trans"+4+ "_laketrial_aug13_2018.wav"]);
[c5, Fs] = audioread(["sendloc3_trans"+5+ "_laketrial_aug13_2018.wav"]);
c1 = c1(:,1);
c2 = c2(:,1);
c3 = c3(:,1);
c4 = c4(:,1);
c5 = c5(:,1);
[acfc1, lagc] = autocorr(c1);
acfc2 = autocorr(c2);
acfc3 = autocorr(c3);
acfc4 = autocorr(c4);
acfc5 = autocorr(c5);

figure;
subplot(3,1,1);
hold on;
stem(laga, acfa1, 'fill');
stem(laga, acfa2, 'fill');
stem(laga, acfa3, 'fill');
stem(laga, acfa4, 'fill');
stem(laga, acfa5, 'fill');
hold off;
legend({'R_{a_1}(\tau)','R_{a_2}(\tau)','R_{a_3}(\tau)','R_{a_4}(\tau)','R_{a_5}(\tau)'},'NumColumns',3)
xlabel('Lags')
ylabel('Correlation')
%sendloc2
subplot(3,1,2);
hold on;
stem(laga, acfb1, 'fill');
stem(laga, acfb2, 'fill');
stem(laga, acfb3, 'fill');
stem(laga, acfb4, 'fill');
stem(laga, acfb5, 'fill');
hold off;
legend({'R_{b_1}(\tau)','R_{b_2}(\tau)','R_{b_3}(\tau)','R_{b_4}(\tau)','R_{b_5}(\tau)'},'NumColumns',3)
xlabel('Lags')
ylabel('Correlation')
%sendloc3
subplot(3,1,3);
hold on;
stem(laga, acfc1, 'fill');
stem(laga, acfc2, 'fill');
stem(laga, acfc3, 'fill');
stem(laga, acfc4, 'fill');
stem(laga, acfc5, 'fill');
hold off;
legend({'R_{c_1}(\tau)','R_{c_2}(\tau)','R_{c_3}(\tau)','R_{c_4}(\tau)','R_{c_5}(\tau)'},'NumColumns',3)
xlabel('Lags')
ylabel('Correlation')