close all;
clear;
clc;

R=linspace(0, 1e6, 1000);
Rth = (250.*(R+30))./(3*R + 250);



plot(R, Rth);