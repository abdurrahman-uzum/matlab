close all;
clear;
clc;

Rth=linspace(-100, 100, 1000);
R=50;
V=100;

P = R.*(V./(R+Rth)).^2;

hold on;
grid on;

plot(Rth, P);

xlabel('Rth [\Omega]');
ylabel('Delivered Power [W]');
title('R_L = 50\Omega');
xticks(-100:50:100);

