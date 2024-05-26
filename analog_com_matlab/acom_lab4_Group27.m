%Hüseyin ŞENKULE 2018502103
%Abdurrahman ÜZÜM 2019502099

close all;
clear;
clc;

%% signal generation parameters

f_0 = 5e3;
f_c = 40e3;
K = 3;

% Fs = 100 * f_0;
% Ts = 1/Fs;

Fs = 400e3;
Ts = 1/Fs;

T = 8/f_0;

t = linspace(-T, T, (2*T)/Ts);

% fft parameters
nfft = (2*T)/Ts;
nfft = fix( nfft );

%% signal generation
s = cos(2*pi*f_0*t);
c = cos(2*pi*f_c*t);
sig = s.^3 + 2*c.^3 + 3*s.^2.*c + 3*s.*c.^2;

%% Plot signal wrt time
fig1 = figure( 'WindowStyle', 'Docked' );
        hold on; grid on; grid minor;
        title( 'Signal in time domain' );
        xlabel( 'Time [ s ]' );
        ylabel( 'Amplitude' );
        
        plot ( t, sig );
        

% %% FFT

faxis = linspace( -Fs/2 , Fs/2, nfft );
sig_fft_mag =  abs( fft( sig, nfft ) ) ;

% fft plot
fig2 = figure( 'WindowStyle', 'Docked' );
        hold on; grid on; grid minor;
        title( 'Signal in frequency domain' );
        xlabel( 'Frequency [ Hz ]' );
        ylabel( 'Magnitude' );

        plot ( faxis, fftshift( sig_fft_mag) );
        


%% Ideal Bandstop Filter Generation

% Fs/2 - index = fk ==> index = (Fs/2 - fk) * (nfft/Fs)

% for positive part of the spectrum
fstoplower = 70e3;
fstopupper = 90e3;

lowerindex = nfft/2 + floor(Fs/2 - fstopupper) * (nfft/Fs);
upperindex = nfft/2 + ceil(Fs/2 - fstoplower) * (nfft/Fs);

gbs = zeros( 1, nfft );

gbs( fix(lowerindex) : fix(upperindex) ) = 1;

% for negative part of the spectrum
lowerindex = -nfft/2 + floor(Fs/2 + fstoplower) * (nfft/Fs);
upperindex = -nfft/2 + ceil(Fs/2 + fstopupper) * (nfft/Fs);

gbs( fix(lowerindex) : fix(upperindex) ) = 1;


fig3 = figure( 'WindowStyle', 'Docked' );

        hold on; grid on; grid minor;

        plot( faxis, gbs );

 
        
        
%% Filtering

sig_fft_filtered =  fft(sig,nfft).* gbs;

fig4 = figure( 'WindowStyle', 'Docked' );

    subplot( 2, 1, 1 );
        hold on; grid on; grid minor;
        title( 'Unfiltered Signal and Bandstop Filter' );
        xlabel( 'Frequency [ Hz ]' );
        ylabel( 'Magnitude' );
        
        yyaxis left;
        plot( faxis, fftshift(sig_fft_mag) );
        
        yyaxis right;
        plot( faxis, fftshift(gbs) );
    
        
     subplot( 2, 1, 2 );
        hold on; grid on; grid minor;
        title( 'Filtered Signal' );
        xlabel( 'Frequency [ Hz ]' );
        ylabel( 'Magnitude' );
        
        plot( faxis, fftshift(abs(sig_fft_filtered)) );
        
        
%% Inverse Fourier Transform

topsinyal = real( ifft( sig_fft_filtered, nfft ) );

calc_sig = (1/2)*cos(2*pi*(2*f_c + f_0)*t) + (1/2)*cos(2*pi*(2*f_c - f_0)*t)

fig5 = figure( 'WindowStyle', 'Docked' );

    subplot( 2, 1, 1 );
        hold on; grid on; grid minor;
        title( 'Ideal Signal' );
        xlabel( 'Time [ s ]' );
        ylabel( 'Amplitude' );
        
        ylim( [-2, 2] );
        plot( t, calc_sig );
       
    
        
     subplot( 2, 1, 2 );
        hold on; grid on; grid minor;
        title( 'Recovered Signal' );
        xlabel( 'Time [ s ]' );
        ylabel( 'Amplitude' );
        
        ylim( [-2, 2] );
        plot( t, topsinyal );
      

          
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


%% TEST SNIPPETS

% Bounding Square Wave

% k = 3;
% upperb = ( ( 2*k -3) * T ) / K
% lowerb = ( ( 2*k -5) * T ) / K
% bsq = heaviside( t - lowerb ) - heaviside( t - upperb );
% 
% figtest = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     plot ( t, bsq );



%Bounded sinusoid

% k = 2;
% upperb =  ( ( 2*k -3) * T ) / K
% lowerb = ( ( 2*k -5) * T ) / K
% bsq = heaviside( t - lowerb ) - heaviside( t - upperb );
% 
% fk = (2*k-1)*f_0;
% sk = cos( 2*pi * fk * t ) .* bsq;
% 
% figtest = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     plot ( t, sk );
%     plot ( t, bsq, '-k' );
% 


% Sum of Bounding Square Waves

% k = 1;
% upperb =  ( ( 2*k -3) * T ) / K;
% lowerb = -( ( 2*k -5) * T ) / K;
% bsq = heaviside( t - lowerb ) - heaviside( t - upperb );
% sbsq = 0 * t;
% 
% 
% figtest = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     for k = 1:K
%         upperb =  ( ( 2*k -3) * T ) / K
%         lowerb = ( ( 2*k -5) * T ) / K
%         bsq = heaviside( t + lowerb ) - heaviside( t - upperb );
%         plot( t, k*bsq );
%         sbsq = sbsq + bsq;
%     end
    
%     plot ( t, sbsq );







    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


