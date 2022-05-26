clear;
clc;
%matlab script for finding polyomial roots

syms i0 v0 v1 v2 
eqn1 = (1/2)*i0+v0*(1/200)+v1/100+v2/4==38.5/20;
eqn2 = -2*i0-v0/25+v1/20==0;
eqn3 = -i0/10+13*v0/20-v1/25-v2/50==0;
eqn4 = 15*i0/50-v0/50+17*v2/50==38.5/20


[A,B] = equationsToMatrix([eqn1, eqn2,eqn3,eqn4], [i0,]);


X = linsolve(A,B);

%source:https://www.mathworks.com/help/symbolic/solve-a-system-of-linear-equations.html

%This is AYBERK KONUK's original work 29.21.2020