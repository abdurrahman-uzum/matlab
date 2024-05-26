close all;
clear;

% Kmax = 10e3;
% Kcount = 100;
% K = linspace( 0, Kmax, Kcount );

% 
% Gc = tf( [ 1, 0.336 ], [ 1 0.01 ] );
% T = feedback( series( G, Gc ), 1 );


G = tf ( 1, [ 1 2 0 ] );

q1a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    rlocus( G );
    
    


Gc = tf( [ 1, 0.336 ], [ 1 0.01 ] );
T = feedback( G, Gc );

q2a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    rlocus( T );
    
    
    
    
    
t = 0 : 0.01 : 10; 
r = t;
    
q3a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    lsim( T, r, t );
    
    
    
    
    
G2 = tf( [ 1 ], [ 1 1 0 ] );
q4a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;

     rlocus( G2 );
     
     
     
Gc2 = 60 * tf( [ 1 2 ], [ 1 9 ] );
T2 = series( G2, Gc2 );
 
q5a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;

     rlocus( T2 );
     
     
G3 = tf( [ 1 ], [ 1 2 0 ] ) ;

q6a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;

     rlocus( G3 );
     
 
     
Gc3 = tf( [ 1 0.57 ], [ 1 0.149 ] );
T3 = series( G3, Gc3 );
     
q7a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;

     rlocus( T3 );
     
     
     
t = linspace( 0, 10, 1000 );    
r = t;
q8a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    lsim( T3, r, t );
    
    
    
t = linspace( 0, 10, 1000 );    
u = heaviside( t ); 

q9a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    lsim( T3, u, t );
    
    
    
    

G4 = tf( [ 400 ], [ 1 30 200 0 ] );
    
q10a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    rlocus( G4 );
    
    
    
    
    
    
Gc4 = 0.00125 * tf( [ 1 0 ], [ 1 31.34 ] );
T4 = series( G4, Gc4 );

q11a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    rlocus( T4 );
     
    
    
t = linspace( 0, 10, 1000 );
u = heaviside( t );

q12a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    lsim( T4, u, t );
 

    
    
    
    
% f2 = figure( 'WindowStyle', 'Docked' );
% hold on; grid on; grid minor;
% t = 0 : 0.01 : 3;
% u = ones( 1, length( t ) );
% lsim( sys1, u , t );
% lsim( sysid, u, t );
% axis( [0 3 0 0.3 ] );
% legend( 'res', 'ideal' );







































