close all;
clear;
clc;

num1 = 0.356;
den1 = [ 1, 1.33 ];

[R, P, K] = residue( num1, den1 );

syms s H;
H = R(1) / (s - P(1)) ;
pretty(H)

step( H )

sys1 = tf( 0.356, [ 1, 1.33 ] );
sysid = tf( 0.8, [ 1, 3 ] );

f1 = figure( 'WindowStyle', 'Docked' );
hold on; grid on; grid minor;
step( sys1 )
step ( sysid )
legend( 'res', 'ideal' );


f2 = figure( 'WindowStyle', 'Docked' );
hold on; grid on; grid minor;
t = 0 : 0.01 : 3;
u = ones( 1, length( t ) );
lsim( sys1, u , t );
lsim( sysid, u, t );
axis( [0 3 0 0.3 ] );
legend( 'res', 'ideal' );


%  f3 = figure( 'WindowStyle', 'Docked' );
% hold on; grid on; grid minor;
% t = 0 : 0.01 : 3;
% u = ones( 1, length( t ) );
% 
% [r, p, k] = residue( 0.9, [ 1, 3 ] );
% 
% syms s c
% c = ilaplace( r(1)/(s-p(1)) ) + ilaplace( r(2)/(s-p(2)) );
% pretty c
% 
% t = 0 : 0.1 : 3;
% y = 4/15 - (4 * exp( -3*t) ) / 15;
% 
% plot( t, y );




f3 = figure( 'WindowStyle', 'Docked' );
hold on; grid on; grid minor;

[r, p ,k]= residue(0.356, [1 1.33 0]);
syms s c
c = ilaplace( r(1)/(s-p(1)) ) + ilaplace( r(2)/(s-p(2)));
pretty(c)

t = 0:0.1:3;
y = 4/15 - (4*exp(-3*t))/15;

plot (t,y);title ('Step respose of the system'); xlabel('time');ylabel('y(t)');

    





sys2 = tf( 4, [ 1, 1.6, 4 ] );
% sysid = tf( 0.8, [ 1, 3 ] );

f4 = figure( 'WindowStyle', 'Docked' );
hold on; grid on; grid minor;
step( sys2 )
title( 'Step response of Q2' );
ylabel( 'y(t)' );
% step ( sysid )
% legend( 'res', 'ideal' );




f5a = figure( 'WindowStyle', 'Docked' ) ;
hold on; grid on; grid minor;

sys3a = tf( 2, [1 2] );
step( sys3a );
title( 'Step Resp. of Q3a' );


f5b = figure( 'WindowStyle', 'Docked' ) ;
hold on; grid on; grid minor;

pzmap( 2, [1 2] )
title( 'Pole-Zero of Q3a' );







f6a = figure( 'WindowStyle', 'Docked' ) ;
hold on; grid on; grid minor;

sys3b = tf( [ 10 70 ], [1 30 200] );
step( sys3b );,
title( 'Step Resp. of Q3b' );


f6b = figure( 'WindowStyle', 'Docked' ) ;
hold on; grid on; grid minor;

pzmap( [ 10 70 ], [1 30 200] )
title( 'Pole-zero of Q3b' );

clc; 
stepinfo sys3b






f7a = figure( 'WindowStyle', 'Docked' ) ;
hold on; grid on; grid minor;

sys3c = tf( -2, [1 0 4 ] );
step( sys3c );
title( 'Step Resp. of Q3c' );
xlim([-0 10] );


f7b = figure( 'WindowStyle', 'Docked' ) ;
hold on; grid on; grid minor;

pzmap( -2, [1 0 4 ] );
title( 'Pole-zero of Q3c' );

clc; 
stepinfo sys3c



f8a = figure( 'WindowStyle', 'Docked' ) ;
hold on; grid on; grid minor;

sys3d = tf( [1 2], [1 20 100 ] );
step( sys3d );
title( 'Step Resp. of Q3d' );


f8b = figure( 'WindowStyle', 'Docked' ) ;
hold on; grid on; grid minor;

pzmap( [1 2], [1 20 100 ] );
title( 'Pole-zero of Q3d' );

clc; 
stepinfo sys3d











