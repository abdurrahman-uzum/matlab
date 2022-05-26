close all;
clear;
clc;



R = 2200;
C = 220e-9;
tho = R*C;

T = 2*tho;


Vsp = 10;
Vsn = -10;

t = linspace(0, 2*T, 1000);
interval = [0:1:5];

Vs = ( mod(t,T) <= T )*Vsp + ( mod(t,T) > T )*Vsn; 

