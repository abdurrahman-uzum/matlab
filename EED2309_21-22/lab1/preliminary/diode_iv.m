
clear;
clc;

I_S = 1*10^-12;
n = 1;
V_T = 25*10^-3;
V_D = -1 : 0.001 : 1;

I_D = I_S * ( exp(V_D/(n*V_T)) - 1 );
%I_D(0:999) = I_D(0:999).*10^12;

hold on;

plot( V_D( 1000:2000 ), I_D(1000:2000), 'b', 'LineWidth', 2 );
plot( V_D( 1:999 ), I_D(1:999).*10^12, 'b', 'LineWidth', 2 );
xlim([-1 1]);
ylim([-10 10]);

line([0,0], ylim, 'Color', 'k'); % Draw line for Y axis.
line(xlim, [0,0], 'Color', 'k'); % Draw line for X axis.

xlabel( "V_D [V]" );
ylabel( "[pA]      I_D      [A]" );










% 
% Vj = 0.7;
% R = 2200;
% 
% 
% t = 0:0.000001:0.002;
% Vi = 4*sin(1000*2*pi*t);
% Vd = min(Vi, Vj);
% Vr = max( (Vi - Vj), 0 );
% I  = zeros( 1, length(t) );
% 
% 
%         
% 
% 
% 
% %%
% hold on;
% grid on;
% 
% plot( t, Vi, 'k--' );
% 
% plot( t, Vr, 'r' );
% 
% plot( t, Vd, 'b' );
% 
% %plot( t, I, 'r' );
% 
% legend( 'Vi', 'Vr', 'Vd' );
% xlabel( "time (s)" );
% ylabel( "voltage (V)" );
% title( "CVD Modelled Diode Half Wawe Rectifier Characteristics" );


















