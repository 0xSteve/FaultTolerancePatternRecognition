close all; clear; clc;

set(0,'DefaultAxesFontName', 'Times New Roman')
set(0,'DefaultAxesFontSize', 16)

s1n = 'no_space_sendloc1_aug13.csv';
s2n = 'no_space_sendloc2_aug13.csv';
s3n = 'no_space_sendloc3_aug13.csv';
rn = 'no_space_homeloc_aug13.csv';
dir = 'test_aug13';
s1tc = thermoreader(s1n,dir);
s2tc = thermoreader(s2n,dir);
s3tc = thermoreader(s3n,dir);
rtc = thermoreader(rn,dir);
[x1, y1] = plot_thermocline(s1tc, s1n, dir, '');
[x2, y2] = plot_thermocline(s2tc, s2n, dir, '');
[x3, y3] = plot_thermocline(s3tc, s3n, dir, '');
[xr, yr] = plot_thermocline(rtc, rn, dir, '');