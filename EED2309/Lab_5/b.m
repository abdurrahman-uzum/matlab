%% CVD Modelled Diode Half Wawe Rectifier Characteristics %%

clear;
clc;

%% Parameters %%
Vj = 0.7;
R = 2200;

%%

t = 0:0.000001:0.002;
Vi = 4*sin(1000*2*pi*t);
Vd = max(Vi, -Vj);
Vr = min( (Vi + Vj), 0 );
I  = zeros( 1, length(t) );


        



%%
hold on;
grid on;

plot( t, Vi, 'k--' );

plot( t, Vr, 'r' );

plot( t, Vd, 'b' );

%plot( t, I, 'r' );

legend( 'Vi', 'Vr', 'Vd' );
xlabel( "time (s)" );
ylabel( "voltage (V)" );
title( "CVD Modelled Diode Half Wawe Rectifier Characteristics" );


















