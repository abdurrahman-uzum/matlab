close all;
clear;
clc;

q1a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    H = tf( [ 5 4 ], [1 3 1 4 12] );
    step( H );
    
    title( 'Q1 Step response');
    
    
    
q2a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    
    A = [ 3, -5, 2 ; 1, -3, 7 ; -3, -6, 2 ];
    B = [ 5, -2, 2 ]';
    C = [ 1, -4, 2 ];
    D = 0;

    [num, den] = ss2tf( A, B, C, D );
    G = tf( num, den ) 
    % [ Z, P, K ] = tf2zpk( num, den )
    
    step( G );


    
    
    
    
    
  q3a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;  
    
    z3a = [];
    p3a = [ (-8 + j*11), (-8 - j*11) ];
    k3a = 13.56^2;
    
    [num3a, den3a] = zp2tf( z3a, p3a, k3a );
    H3a = tf ( num3a, den3a );
    stepinfo( H3a )
    step( H3a );
    
    
  q3b = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;  
    
    z3b = [];
    p3b = [ -0.35 -2.45 ];
    k3b = 0.92^2;
    
    [num3b, den3b] = zp2tf( z3b, p3b, k3b );
    H3b = tf ( num3b, den3b );
    stepinfo( H3b )
    step( H3b );
    
    
 q3c = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;  
    
    z3c = [];
    p3c = [ (-1 + j*1.56), (-1 - j*1.56) ];
    k3c = 1.85^2;
    
    [num3c, den3c] = zp2tf( z3c, p3c, k3c );
    H3c = tf ( num3c, den3c );
    stepinfo( H3c )
    step( H3c );
    
    
%% q6
    
    Gc = tf( 1, [1 1] );
    Gp = tf( [1 2], [1 3] );
    sys = series( Gc, Gp );
    
    T = feedback( sys, 1, -1 )
    
    %%
    
q7 = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;  
        
    t = 0 : 0.1 : 10;
    ramp = t;
    
    lsim( T, ramp, t );





%% Preliminary 

% t = linspace( 0, 10, 1001 );
% 
% f = -6.65 * exp( -2.43 * t ) - 6 * exp ( -2 * t ) ...
%     + exp( 0.71 * t ) .* ( 15.1 .* cos( 1.4*t ) - 14 .* sin( 1.4*t )  );
% 
% fig1 = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     plot( t, f );
% 
%     
%     
% sys = tf( [ 5 4 ], [ 1 3 1 4 12 ] );
% 
% fig2 = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     plot( t, f, 'k' );
%     step( sys, t );
%     
% 
%     
% %question 2 
% 
% A = [ 3, -5, 2 ; 1, -3, 7 ; -3, -6, 2 ];
% B = [ 5, -2, 2 ]';
% C = [ 1, -4, 2 ];
% D = 0;
% 
% [num, den] = ss2tf( A, B, C, D );
% G = tf( num, den ) 
% % [ Z, P, K ] = tf2zpk( num, den )



% syms s;
% 
% sIA = s * eye(3) - A
% 
% sIAinv = inv( sIA )
% 
% CsIAinv = C * sIAinv
% 
% CsIAinvB = CsIAinv * B
% 
% pretty( CsIAinvB )






% CsIAinvB = (C * ( inv( s * eye(3) - A ) )) * B
% 
% pretty( CsIAinvB )







