close all;
clear;





num1 = [ 1 -2 2 ];
den1 = [ 1 7 12 0 ];



q1a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    rlocus( num1, den1 );
    
    
    
    
q1b = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    G = tf( num1, den1 );
    T1 = feedback(  2*G, 1 );
    T2 = feedback( 10*G, 1 );
    
    subplot( 2, 1, 1 );
        step( T1 );
        title( 'Stable System for K = 2' );
        
    subplot( 2, 1, 2 );
        step( T2 );
        title( 'Unstable System for K = 10' );
        
  
        
num2 = [ 2 1 2 ];
den2 = [ 1 5 6 0 ];
        
q2a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    rlocus( num2, den2 );
    
    
    
    
num3 = [ 1 -4 20 ];
den3 = [ 1 7 10 ];
        
q3a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    rlocus( num3, den3 );
    sgrid( 0.45, 0 );
    
    
    
    
q4a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    G = tf ( 1, [1 0] );
    Gc_1 = tf( 1, 1 );
    Gc_2 = tf( [1 2], 1 );
    Gc_3 = tf( 1, [1 2] );
    
    subplot( 3, 1, 1 );
        rlocus( G * Gc_1 );
        title( 'Added constant gain' );
    
    subplot( 3, 1, 2 );
        rlocus( G * Gc_2 );
        title( 'Added zero' );
        
    subplot( 3, 1, 3 );
        rlocus( G * Gc_3 );
        title( 'Added pole' );
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
% q1a = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minot;
%     
%     
%     
%     
% q1a = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minot;
%     
%     
%     
%     
% q1a = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minot;
%     
%     
%     
%     
% q1a = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minot;
    
    