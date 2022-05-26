close all;
clear;
clc;

% 
% 
% S = linspace(-1,1,100);
% 
% x = linspace(-1, 1, 100);
% 
% [ReS, ImS] = f(x,S);
% 
% hold on;
% grid on;
% 
% plot(ReS, ImS );
% 
% 
% 
% function [xx, yy] = f(x,y)
%    xx = x-y.^2;
%    yy = x+y;
% end

S = linspace(-10,10,100)';
S = 2 + 1i*S;
SS = f(S);

plot( real(SS), imag(SS) );

function [zz] = f(z)
    zz = (1+1i)*z;
end
    
    
    
    
    
    
    
    
    
    