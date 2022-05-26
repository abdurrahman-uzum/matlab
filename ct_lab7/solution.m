close all;
clear;
clc;

R   = 100;
L   = 1e-3;
tau = L/R;
w   = 2*pi*1000;
A   = 1;

t = linspace(0, 4e-3, 1000); 

vo = (( 1/(L^2*w^2 + R^2) )) * ((  A*R^2*exp(-t/tau) - A*R*L*w*sin(w*t) + A*L^2*w^2*cos(w*t)  ));
i = 1/(tau^2 * w^2 + 1) * ((  -A*R*exp(-t/tau) + A*R*cos(w*t) + A*L*w*sin(w*t)  ));

f = figure('WindowStyle','Docked');
hold on;
grid on;

plot(t, vo);
plot(t, A*cos(w*t), 'k--');


