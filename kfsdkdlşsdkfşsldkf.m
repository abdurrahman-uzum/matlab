close all;
clear;
clc;

Rth = (250.*(R+30))./(3*R + 250);

R=linspace(0, 1e6, 1000);

plot(R, Rth);