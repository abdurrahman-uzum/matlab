close all;
clear;
clc;


% num = [2, 5, 3, 6];
% den = [1, 6, 11, 6];
% 
% [R, P, K] = residue(num, den)
% 
% syms s H;
% H = R(1) / (s - P(1)) + R(2) / (s - P(2)) + R(3) / (s-P(3)) + K;
% pretty(H)


% num = [2, 2, -3];
% den = [1, 6, 12, 8];
% 
% [R, P, K] = residue(num, den)
% 
% syms s H;
% H = R(1) / (s - P(1)) + R(2) / (s - P(2)) + R(3) / (s-P(3)) ;
% pretty(H)

% clc;
% clear;
% 
% num = [4, 16, 12];
% den = [4, 11, 34, 24, 0];
% 
% [R, P, K] = residue(num, den);
% 
% R = round(R, 2 )
% P = round(P, 2 )
% 
% syms s H;
% H = R(1) / (s - P(1)) + R(2) / (s - P(2)) + R(3) / (s-P(3)) ;
% 
% pretty(H)



% num = [ 0.25, 2];
% den = [ 1, 8, 1.75, 6 ];
% 
% H = tf (num, den )
% 
% step(10*H)




z = [ -1, -2 ]';
p = [ -1+4i, -1-4i, -4 ]';
k = 3;

[num, den] = zp2tf( z, p, k )

H = tf( num, den )

[ A, B, C, D ] = tf2ss( num, den )

























