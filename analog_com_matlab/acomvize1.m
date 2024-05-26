close all;
clear;

% signal parameters 
K = 5;
f0 = 1e3;

% carrier parameters
fc = 50 * f0;

% time parameters
Fs = 10000e3;
Ts = 1/Fs;
T = 3/f0;
% t = linspace( -T, T, Fs );
t = -T : Ts : T;
% fft parameters
nfft = (2*T)/Ts +1;
nfft = fix( nfft );
f = linspace( -Fs/2 , Fs/2, nfft );




%%
% generating signal
s = 0 * t;
for k = 1:K
    
    s = s + (k - K/2)*cos( 2*pi * k*f0 * t );
    
end
    
% complex fft of s:
s_jw = fft( s, nfft );



fig1 = figure( 'WindowStyle', 'Docked' );

    subplot(2, 1, 1 );
        hold on; grid on; grid minor;
        title( 'signal' );
        plot( t, s );
        
    subplot(2, 1, 2 );
        hold on; grid on; grid minor;
        title( 'fft' );
        plot( f, fftshift( abs( s_jw ) ) );
        xlim([-10e3, 10e3] );

 
        
% Modulated signal
phi = s .* cos( 2*pi * fc * t );

% fft of modulated signal
phi_jw = fft( phi, nfft );

fig2 = figure( 'WindowStyle', 'Docked' );
    subplot(2, 1, 1 );
        hold on; grid on; grid minor;
        title( 'modulated' );
        plot( t, phi );
        
    subplot(2, 1, 2 );
        hold on; grid on; grid minor;
        title( 'modulated - fft' );
        plot( f, fftshift( abs( phi_jw ) ) );
        xlim([ -60e3, 60e3] );


%%
% Ideal Coherent Demodulation
sr = phi .* cos( 2*pi * fc * t );
% fft
sr_jw = fft ( sr, nfft );


fig3 = figure( 'WindowStyle', 'Docked' );

    subplot(2, 1, 1 );
        hold on; grid on; grid minor;
        title( 'cos^2' );
        plot( t, sr );
        
    subplot(2, 1, 2 );
        hold on; grid on; grid minor;
        title( 'cos^2 - fft' );
        plot( f, fftshift( abs( sr_jw ) ) );
        xlim([ -125e3, 125e3] );

        
        
%% lowpass filter:

lpf = zeros( 1, nfft );

fstop = 10e3;

indexp = nfft/2 + (Fs/2 - fstop) * ( nfft/Fs );
indexn = -nfft/2 + (Fs/2 + fstop) * ( nfft/Fs );

lpf( ( floor( indexp ) ) : end ) = 1;
lpf( 1 : ( ceil( indexn ) ) ) = 1;

%% filter the signal

sr_jw_f = sr_jw .* lpf;


fig4 = figure( 'WindowStyle', 'Docked' );
    subplot( 2, 1, 1 );
        hold on; grid on; grid minor;
        title( 'cos^2 - fft to be filtered' );

        yyaxis left;
        plot( f, fftshift( abs( sr_jw ) ) );

        yyaxis right;
        plot( f, fftshift( lpf ) );

        xlim([ -125e3, 125e3] );
    
     subplot( 2, 1, 2 );
        hold on; grid on; grid minor;
        title( 'filtered' );
        plot( f, fftshift(abs(sr_jw_f)) );
        
        xlim([ -125e3, 125e3] );


%% inverse fft

sr_t = real ( ifft( sr_jw_f, nfft ) );


fig5 = figure( 'WindowStyle', 'Docked' );
    subplot( 2, 1, 1 );
        hold on; grid on; grid minor;
        title( 'Original Signal' );
        plot( t, s );

     subplot( 2, 1, 2 );
        hold on; grid on; grid minor;
        title( 'Reconstructed Signal' );
        
        plot( t, sr_t );

        
        
        
%%
% Imperfect Coherent Demodulation

theta  = 1/(2*pi); 
fc_err = 0.01;

sr_poor = phi .* cos( 2*pi * ( 1+fc_err ) * fc * t + theta );
% fft
sr_poor_jw = fft ( sr_poor, nfft );


fig6 = figure( 'WindowStyle', 'Docked' );

    subplot(2, 1, 1 );
        hold on; grid on; grid minor;
        title( 'cos^2' );
        
        plot( t, sr );
        plot( t, sr_poor );
        legend( 'Ideal', 'Poor' );

    subplot(2, 1, 2 );
        hold on; grid on; grid minor;
        title( 'cos^2 - fft' );
        
        plot( f, fftshift( abs( sr_jw ) ) );
        plot( f, fftshift( abs( sr_poor_jw ) ) );
        legend( 'Ideal', 'Poor' );
        
        xlim([ -125e3, 125e3] );
        
        
% filter the poorly synchronised signal:

sr_poor_jw_f = sr_poor_jw .* lpf;

sr_poor_t = real ( ifft( sr_poor_jw_f, nfft ) );


fig7 = figure( 'WindowStyle', 'Docked' );
    subplot( 3, 1, 1 );
        hold on; grid on; grid minor;
        title( 'Original Signal' );
        
        plot( t, s );
        
    subplot( 3, 1, 2 );
        hold on; grid on; grid minor;
        title( 'Properly Reconstructed Signal' );
        
        plot( t, sr_t );

     subplot( 3, 1, 3 );
        hold on; grid on; grid minor;
        title( 'Poorly Reconstructed Signal' );
        
        plot( t, sr_poor_t );
       

%%
%%
%% DSB  - LC 

% % Rectifier Demodulation?:
% 
% sincount = 100;
% rectw = 0.5;
% sign = 1;
% 
% for k = 1:2:sincount
%     
%     sign = -sign;
%     rectw = rectw + ( (2/pi) .* (sign) .* (1./k) .* cos( 2*pi .* k.*f0 .* t ) );
% 
% end
% 
% figXX = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     title( 'Positive Square wave using Fourier Series' );
%     plot( t, rectw );

        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
%%
%%
%%
%%

%         
% close all;
% clear;
% 
% % signal parameters 
% K = 5;
% f0 = 1e3;
% 
% % carrier parameters
% fc = 50 * f0;
% 
% % time parameters
% Fs = 10000e3;
% Ts = 1/Fs;
% T = 3/f0;
% % t = linspace( -T, T, Fs );
% t = -T : Ts : T;
% % fft parameters
% nfft = (2*T)/Ts +1;
% nfft = fix( nfft );
% f = linspace( -Fs/2 , Fs/2, nfft );
% 
% 
% 
% 
% %%
% % generating signal
% s = 0 * t;
% for k = 1:K
%     
%     s = s + (k - K/2)*cos( 2*pi * k*f0 * t );
%     
% end
%     
% % complex fft of s:
% s_jw = fft( s, nfft );
% 
% 
% 
% fig1 = figure( 'WindowStyle', 'Docked' );
% 
%     subplot(2, 1, 1 );
%         hold on; grid on; grid minor;
%         title( 'signal' );
%         plot( t, s );
%         
%     subplot(2, 1, 2 );
%         hold on; grid on; grid minor;
%         title( 'fft' );
%         plot( f, fftshift( abs( s_jw ) ) );
%         xlim([-10e3, 10e3] );
% 
%  
%         
% % Modulated signal
% phi = s .* cos( 2*pi * fc * t );
% 
% % fft of modulated signal
% phi_jw = fft( phi, nfft );
% 
% fig2 = figure( 'WindowStyle', 'Docked' );
%     subplot(2, 1, 1 );
%         hold on; grid on; grid minor;
%         title( 'modulated' );
%         plot( t, phi );
%         
%     subplot(2, 1, 2 );
%         hold on; grid on; grid minor;
%         title( 'modulated - fft' );
%         plot( f, fftshift( abs( phi_jw ) ) );
%         xlim([ -60e3, 60e3] );
% 
% 
% 
% % prepare to demodulation
% sb = phi .* cos( 2*pi * fc * t );
% % fft
% sb_jw = fft ( sb, nfft );
% 
% 
% fig3 = figure( 'WindowStyle', 'Docked' );
% 
%     subplot(2, 1, 1 );
%         hold on; grid on; grid minor;
%         title( 'cos^2' );
%         plot( t, sb );
%         
%     subplot(2, 1, 2 );
%         hold on; grid on; grid minor;
%         title( 'cos^2 - fft' );
%         plot( f, fftshift( abs( sb_jw ) ) );
%         xlim([ -125e3, 125e3] );
% 
%         
%         
% %% lowpass filter:
% 
% lpf = zeros( 1, nfft );
% 
% fstop = 10e3;
% 
% indexp = nfft/2 + (Fs/2 - fstop) * ( nfft/Fs );
% indexn = -nfft/2 + (Fs/2 + fstop) * ( nfft/Fs );
% 
% lpf( ( floor( indexp ) ) : end ) = 1;
% lpf( 1 : ( ceil( indexn ) ) ) = 1;
% 
% %% filter the signal
% 
% sb_jw_f = sb_jw .* lpf;
% 
% 
% 
% fig4 = figure( 'WindowStyle', 'Docked' );
%     subplot( 2, 1, 1 );
%         hold on; grid on; grid minor;
%         title( 'cos^2 - fft to be filtered' );
% 
%         yyaxis left;
%         plot( f, fftshift( abs( sb_jw ) ) );
% 
%         yyaxis right;
%         plot( f, fftshift( lpf ) );
% 
%         xlim([ -125e3, 125e3] );
%     
%      subplot( 2, 1, 2 );
%         hold on; grid on; grid minor;
%         title( 'filtered' );
%         plot( f, fftshift(abs(sb_jw_f)) );
%         
%         xlim([ -125e3, 125e3] );
% 
% 
% %% inverse fft
% 
% sb_t = real ( ifft( sb_jw_f, nfft ) );
% 
% 
% fig5 = figure( 'WindowStyle', 'Docked' );
%     subplot( 2, 1, 1 );
%         hold on; grid on; grid minor;
%         title( 'Original Signal' );
%         plot( t, s );
% 
%      subplot( 2, 1, 2 );
%         hold on; grid on; grid minor;
%         title( 'Reconstructed Signal' );
%         
%         plot( t, sb_t );
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
