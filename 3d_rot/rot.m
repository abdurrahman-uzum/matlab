close all;
clear;
clc;

r=1;
phi = linspace(0, 2*pi, 100);
theta = linspace(0, pi, 100);
t = 1;

rotm = [ 1,      0,       0;
        0, cos(t), -sin(t);
        0, sin(t),  cos(t);   ];

x = (r.*sin(theta))'*cos(phi);
y = (r.*sin(theta))'*sin(phi);
z = 1 + 0*r.*cos(theta);

f = 

plt = plot3(f(:,1), f(:,2), f(:,3));



% theta=[0:0.1:2*pi];
% phi=[0:0.1:pi/4];
% R=1;
% [THETA,PHI]=meshgrid(theta,phi);
% X1=R.*cos(THETA).*sin(PHI);
% Y1=R.*sin(THETA).*sin(PHI);
% Z1=R.*cos(PHI);
% surf(X1,Y1,Z1)