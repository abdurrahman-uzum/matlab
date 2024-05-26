close all; 
clear;

t = linspace( 0, 4, 1000 );


p1 = [ -2 + 5*1j, -2 - 5*1j ];

[ num1, den1 ] = zp2tf( [], p1, 29 );

sys1 = tf( num1, den1 );

fig = figure( 'WindowStyle', 'Docked' );
hold on; grid on; grid minor;
step( sys1, t );
plot( t, 1+exp( -2*t ) );
xlim( [ 0, 4 ] );
ylim( [ 0, 1.5 ] );



p2 = [ -5 + 10*1j, -5 - 10*1j ];

[ num2, den2 ] = zp2tf( [], p2, 125 );

sys2 = tf( num2, den2 );

fig2 = figure( 'WindowStyle', 'Docked' );
hold on; grid on; grid minor;
step( sys2, t );
plot( t, 1+exp( -5*t ) );
xlim( [ 0, 4 ] );
ylim( [ 0, 1.5 ] );




p3 = [ -4, -4 ];

[ num3, den3 ] = zp2tf( [], p3, 16 );

sys3 = tf( num3, den3 );

fig3 = figure( 'WindowStyle', 'Docked' );
hold on; grid on; grid minor;
step( sys3, t );
xlim( [ 0, 4 ] );
ylim( [ 0, 1.5 ] );



p4 = [ -2, -5 ];

[ num4, den4 ] = zp2tf( [], p4, 10 );

sys4 = tf( num4, den4 );

fig4 = figure( 'WindowStyle', 'Docked' );
hold on; grid on; grid minor;
step( sys4, t );
xlim( [ 0, 4 ] );
ylim( [ 0, 1.5 ] );








p5 = [ -4+3*1j, -4-3*1j ];

[ num5, den5 ] = zp2tf( [], p5, 25 );

sys5 = tf( num5, den5 );

fig5 = figure( 'WindowStyle', 'Docked' );
hold on; grid on; grid minor;
step( sys5, t );
% xlim( [ 0, 4 ] );
% ylim( [ 0, 1.5 ] );












