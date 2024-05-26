close all;
clear;




f11 = figure( 'WindowStyle', 'Docked' );
hold on; grid on; grid minor;
    title( 'Question 1 for 3t ramp' );
    G1 = tf( 2, [ 1 2 0 ] );
    G2 = tf( 4, [ 1 5 ] );

    H = feedback( G1, G2 );

    t = 0 : 0.1 : 100;

    r = 3*t;
    y11 = lsim( H, r , t );
    
    plot( t, y11 );
    plot( t, r );
    
    e = r(end) - y11(end)



f12 = figure( 'WindowStyle', 'Docked' );
hold on; grid on; grid minor;
    title( 'Question 1 for 5u step' );

    G121 = tf( 2, [ 1 2 0 ] );
    G122 = tf( 4, [ 1 5 ] );

    H12 = feedback( G121, G122 );

    t = 0 : 0.1 : 100;

    r = 5 * heaviside(t);
    y12 = lsim( H12, r , t );
    plot( t, y12 );
    e = r(end) - y12(end);



    
f21 = figure( 'WindowStyle', 'Docked' );
hold on; grid on; grid minor;
    title( 'Question 2 for 2u step' );

    G21 = tf( 2, [ 1 2 ] );
    G22 = tf( 3);

    H2 = feedback( G21, G22 );

    t = 0 : 0.001 : 1;

    r = 2 * heaviside(t);
    y21 = lsim( H2, r , t );
    plot( t, y21 );
    e = r(end) - y21(end)



f22 = figure( 'WindowStyle', 'Docked' );
hold on; grid on; grid minor;
    title( 'Question 2 for 3t^2 parabola' );
    G21 = tf( 2, [ 1 2 ] );
    G22 = tf( 3 );

    H2 = feedback( G21, G22 );

    t = 0 : 0.1 : 100;

    r = 3 * (t.^2);
    y22 = lsim( H2, r , t );
    plot( t, y22 );
    e = r(end) - y22(end)
    
    
    
clc;


% syms s K
% Gc = 11 * s + K;
% Gp = 1 / (s * ( s + 1 ));
% 
% H1 = ( Gc * Gp ) / ( 1 + Gc * Gp );
% pretty( simplify( H1 ) )
% 
% H2 = Gp / ( 1 + Gc * Gp );
% pretty( simplify( H2 ) )


clc

G1 = tf( 1, [ 1 5 ] )
G2 = tf( 3, [ 1 3 2 ] );
G3 = tf( 1, [ 1 3 ] );
G4 = tf( 1, [ 1 0 ] );
H =  tf( 1, [ 1 2 ] );

T = ( G3 + G1 * G2 ) / ( G2 * G4  + G3 * H + G1 * G2 * H + 1 )

    

syms g1 g2 g3 g4 h

g = g3 + g1 * g2;
d = 1 / ( 1 + ( g4 * g2 ) );
y = g * d / ( 1 + g * d * h );
simplify(y)
    
    
    
    
    
    















