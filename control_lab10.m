% close all;
% clear;
% 
% sys = tf( 1, [ 1 10 20 ] );
% 
% fig1a = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     [ y, t ] = step( sys );
%     step( sys );
%     error = 1 - y(end)
%     stepinfo( sys )
%     
%     
% sys_cl = feedback( 300 * sys, 1 );
% 
% fig2a = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     [ y, t ] = step( sys_cl );
%     step( sys_cl )
%     error = 1 - y(end)
%     stepinfo( sys_cl )
%     
%     
% 
%     
%     
%     
%     
% Kp = 300;
% Kd = 10;
% 
% Gc = tf( [ Kd Kp ], 1 );
% sys_pd = feedback( series( sys, Gc ), 1 )
% 
% fig3a = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     [ y, t ] = step( sys_pd );
%     step( sys_pd )
%     error = 1 - y(end)
%     stepinfo( sys_pd )
%     
%     
%     
%     
% Kp = 30;
% Ki = 70;
% 
% Gc = tf( [ Kp Ki ], [ 1 0 ] );
% sys_pi = feedback( series( sys, Gc ), 1 )
% 
% fig4a = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     [ y, t ] = step( sys_pi );
%     step( sys_pi )
%     error = 1 - y(end)
%     stepinfo( sys_pi )
%     
%     
%     
%     
% Kp = 350;
% Kd = 50;
% Ki = 300;
% 
% Gc = tf( [Kd Kp Ki ], [ 1 0 ] );
% sys_pid = feedback( series( sys, Gc ), 1 )
% 
% fig5a = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     [ y, t ] = step( sys_pid );
%     step( sys_pid )
%     error = 1 - y(end)
%     stepinfo( sys_pid )
%     
%     
%     
%     
%     
%     
% 
% Gp = tf( 400, [ 1 48.5 0 ] );
% 
% fig6a = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     [ y, t ] = step( Gp );
%     step( Gp )
%     error = 1 - y(end)
%     stepinfo( Gp )



close all;
clear;








% Gc = tf( [Kd Kp Ki ], [ 1 0 ] );
% sys_pid = feedback( series( sys, Gc ), 1 )
% 
% fig5a = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     [ y, t ] = step( sys_pid );
%     step( sys_pid )
%     error = 1 - y(end)
%     stepinfo( sys_pid )
    
    
    
    
    
    
    
%     
% Gp = tf( 400, [ 1 48.5 0 ] );    
%     
% P = tf( 300, 1 );
% I = tf( 10, [ 1 0 ] );
% D = tf( [ 0.1 0 ], 1 )
% 
% Gc = P + I + D;
% 
% G = feedback( series( Gc, Gp ), 1 );
% 
% 
% 
% 
% fig7a = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     [ y, t ] = step( G );
%     step( G )
%     error = 1 - y(end)
%     stepinfo( G )
% 
% 
% 




Kd = [0.1, 0.9, 2];
Kp = 100;
Ki = 10;

Gp = tf(400,[1 48.5 0]);

for i=1:1:length(Kd)
    cont_sys = tf([Kd(i), Kp, Ki],[1 0])
    
    sys = feedback( series(cont_sys, Gp), 1 );
    
    subplot(length(Kd),1,i);
    
    step(sys);
end




% Kd = 0.9;
% Kp = [ 10 100 300 ];
% Ki = 10;
% 
% Gp = tf(400,[1 48.5 0]);
% 
% for i=1:1:length( Kp )
%     cont_sys = tf([Kd, Kp(i), Ki],[1 0])
%     
%     sys = feedback( series(cont_sys, Gp), 1 );
%     
%     subplot(length(Kp),1,i);
%     
%     step(sys);
%     stepinfo( sys )
% end



% Kd = 0.9;
% Kp = 10;
% Ki = [ 1 10 200 ];
% 
% Gp = tf(400,[1 48.5 0]);
% 
% for i=1:1:length( Ki )
%     cont_sys = tf([Kd, Kp, Ki(i)],[1 0])
%     
%     sys = feedback( series(cont_sys, Gp), 1 );
%     
%     subplot(length(Ki),1,i);
%     
%     step(sys);
%     stepinfo( sys )
% end






%     
%     