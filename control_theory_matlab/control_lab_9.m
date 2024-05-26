close all;
clear;



g1a = tf( [20 20 10] , [ 1 11 10 0] );

fig1a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    nyquist( g1a );
    
    
    
    
    
    
g2a = tf( 250, [ 1 4 50 ] );
g2afb = series( g2a, 1 );

fig2a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    subplot( 3, 1, 1 );
    nyquist( g2afb );
    
    subplot( 3, 1, 2 );
    roots( [ 1 4 50 ] )
    rlocus( [ 1 ], [ 1 4 50 ] );
    
    subplot( 3, 1, 3 ),
    margin( [ 1 ], [ 1 4 50 ] );
    
    
    
    
    
    
    
g3a = tf( 250 , [ 1 4 50 ] );
h3a = tf( 2, [ 1 2 ] );
g3afb = series( g3a, h3a );

roots( [ 1 6 58 100 ] )
fig3a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    subplot( 2, 1, 1 );
    nyquist( g3afb );
    
    subplot( 2, 1, 2 );
    rlocus( g3afb / 500 );
    
    
    
    
    
    
gh4a = tf( 40 , [ 1 6 11 6 ] );

fig4a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    subplot( 2, 1, 1 );
    nyquist( gh4a );
    
    subplot( 2, 1, 2 );
    rlocus( gh4a / 40 );
    
   
    
    
    
    
    
gh5a = 1.5 * gh4a;

fig5a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    nyquist( gh5a );

    
    
    
    
    
    
gh6a = 4 * gh4a;

fig6a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    subplot( 2, 1, 1 );
    nyquist( gh6a );
    
    subplot( 2, 1, 2 );
    margin( gh6a );
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    