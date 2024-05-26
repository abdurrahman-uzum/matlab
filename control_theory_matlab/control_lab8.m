close all;
clear;


% num1 = [ 1 ];
% den1 = [ 1 10 ];
% 
% g1 = tf( num1, den1 );
% 
% fiq1a = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
% 
%     bode( g1 );
%     
% fiq1b = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     margin( g1 );
%     
%     
% fiq1c = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%         
%     rlocus( g1 );
%     
%     
%     
%     
%     
% num2 = [ 1 10 ];
% den2 = [ 1 100 ];
% 
% g2 = tf( num2, den2 );
%     
% fiq2a = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     bode( g2 );
% 
%     
% fiq2b = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     margin( g2 );
%     
% fiq2c = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     rlocus( g2 );
%     
%     
%     
%     
%     
%     
% num3 = [ 1 ];
% den3 = [ 1 9 26 24 ];
% 
% g3 = tf( num3, den3 );   
% 
% sys_cl_1 = feedback( 100*g3, 1 );
% sys_cl_2 = feedback( 250*g3, 1 );
%     
% fiq3a = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     bode( g3 );    
%     
% fiq3b = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     margin( g3 );
%     
% fiq3c = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     rlocus( g3 );
%     
% fig3d = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     subplot( 2, 1, 1 );
%         step( sys_cl_1 );
%         
%     subplot( 2, 1, 2 );
%         step( sys_cl_2 );
%     
% 
%     
    
    
    
num4 = [ 1 ];
den4 = [ 1 0.3 9 0 ];

g4 = tf( num4, den4 );

sys_cl_41 = feedback( 2*g4, 1 );
sys_cl_42 = feedback( 5*g4, 1 );




fiq4a = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;

    bode( g4 );
   
fiq4b = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;

    margin( g4 );
    
fiq4c = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;

    rlocus( g4 );
    
fiq4d = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;

    subplot( 2, 1, 1 );
        step( sys_cl_41 );
        
    subplot( 2, 1, 2 );
        step( sys_cl_42 );
       
        
fiq4e = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    title( 'Unity fb system4 fed with sin(3t)');
    
    t1 = 0:0.01:40;
    t2 = 0:0.01:200;
    
    r1 = sin( 3 * t1 );
    r2 = sin( 0.111 * t2 );
    
    s_cl = feedback( g4, 1 );
    
    subplot( 2, 1, 1 );
        lsim( s_cl, r1, t1 );
        title( 'Unity fb system4 fed with sin(3t)');
    
    subplot( 2, 1, 2 );
        lsim( s_cl, r2, t2 );
        title( 'Unity fb system4 fed with sin(0.111t)');
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    