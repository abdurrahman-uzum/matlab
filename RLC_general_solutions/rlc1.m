close all;
clear;
clc;

t = linspace( 0, 50e-3, 1e3);

A1 = -3;
A2 = 5;

a = 200;
w = 1e3;






f = figure('WindowStyle', 'Docked');
hold on;
grid on;

for a = a : 50 : 2*a
    s1 = -a + sqrt( a^2 - w^2 );
    s2 = -a - sqrt( a^2 - w^2 );
    x = A1*exp( s1*t ) + A2*exp( s2*t );
    plot( t, x );
end


% ylim([-0.1 0.1]);
