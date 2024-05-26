close all;
clear;

f_0 = 5e3;
f_c = 40e3;

F_s = 400e3;
T_s = 1 / F_s;

T = 8 / f_0;

nfft = 2*T / T_s;

t = linspace( -T, T, (2 * T )/T_s );
f = linspace( -F_s/2, F_s/2, nfft );

s = cos( 2*pi* f_0 * t );
c = cos( 2*pi * f_c * t );

z = ( s + c ).^3 + c.^3;

z_jw = fft( z, nfft );

fupper = 90e3;
flower = 70e3;

% for positive part of w spectrum
lowerindex = nfft/2 + floor(F_s/2 - fupper) * (nfft/F_s);
upperindex = nfft/2 + ceil(F_s/2 - flower) * (nfft/F_s);

hbp = zeros( 1, nfft );
hbp( lowerindex : upperindex ) = 1;

lowerindex = -nfft/2 + floor(F_s/2 + flower) * (nfft/F_s);
upperindex = -nfft/2 + ceil(F_s/2 + fupper) * (nfft/F_s);

hbp( lowerindex : upperindex ) = 1;

z_jw_f = z_jw .* hbp;

s_r = real( ifft( z_jw_f, nfft ) );

% recover original signal: dsb-sc:

sdm = s_r .* cos( 2*pi* 2*f_c * t );
% sdm = s_r .* c;




fig1 = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    plot( t, s );
    
    
fig2 = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    plot( t, c );
    
fig3 = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    plot( t, z );
    
    
fig4 = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    plot( f, fftshift( abs(z_jw) ) );
    
fig5 = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    plot( f, ( abs(z_jw) ) );
    
fig6 = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    plot( f, (hbp) );
    
    
fig7 = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    yyaxis left;
    plot( f, fftshift( abs(z_jw) ) );
    
    yyaxis right;
    plot( f, fftshift( hbp ) ); 
    
    
fig8 = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    plot( f, fftshift( abs(z_jw_f) ) );
    
    
    
fig9 = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    plot( t, s_r );
    
    
fig10 = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    
    plot( t, sdm );
    
