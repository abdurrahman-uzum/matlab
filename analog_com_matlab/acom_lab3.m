close all;
clear;
clc;

%% signal generation parameters

fk = 1e3;
K = 3;
Fs = 50 * fk;
Ts = 1/Fs;

T = 50 * (1/fk);

t = -T : Ts : T;

% fft parameters
nfft = (2*T)/Ts;
nfft = fix( nfft );

%% signal generation

sig = 0 * t;
for k = 1 : K
    
    % bounding sq wawe:
    
    upperb =  ( ( 2*k -3) * T ) / K;
    lowerb = -( ( 2*k -5) * T ) / K;
    
    bsq = heaviside( t + lowerb ) - heaviside( t - upperb );
    
    % sinusoids:
    
    sk = cos( 2*pi * k * fk * t ) .* bsq;
    
    sig = sig + sk;   
end



%% Plot signal wrt time
fig1 = figure( 'WindowStyle', 'Docked' );
        hold on; grid on; grid minor;
        title( 'Signal in time domain' );
        xlabel( 'Time [ s ]' );
        ylabel( 'Amplitude' );
        
        plot ( t, sig );
        

%% FFT

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
fstoplower = 1.5e3;
fstopupper = 2.5e3;

lowerindex = nfft/2 + floor(Fs/2 - fstopupper) * (nfft/Fs);
upperindex = nfft/2 +  ceil(Fs/2 - fstoplower) * (nfft/Fs);

gbs = ones( 1, nfft );

gbs( fix(lowerindex) : fix(upperindex) ) = 0;

% for negative part of the spectrum
lowerindex = -nfft/2 + floor(Fs/2 + fstoplower) * (nfft/Fs);
upperindex = -nfft/2 +  ceil(Fs/2 + fstopupper) * (nfft/Fs);

gbs( fix(lowerindex) : fix(upperindex) ) = 0;


fig3 = figure( 'WindowStyle', 'Docked' );

    subplot( 2, 1, 1 );
        hold on; grid on; grid minor;
        
        yyaxis left;
        plot( faxis, sig_fft_mag );
        
        yyaxis right;
        plot( faxis, gbs );

    subplot( 2, 1, 2 );
        hold on; grid on; grid minor;
        
        yyaxis left;
        plot( faxis, fftshift(sig_fft_mag) );
        
        yyaxis right;
        plot( faxis, fftshift(gbs) );
        
        
%% Filtering

sig_fft_mag_filtered = sig_fft_mag .* gbs;

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
        
        plot( faxis, fftshift(sig_fft_mag_filtered) );
        
        

    















%% TEST SNIPPETS

% Bounding Square Wave

% k = 1;
% upperb =  ( ( 2*k -3) * T ) / K;
% lowerb = -( ( 2*k -5) * T ) / K;
% bsq = heaviside( t + lowerb ) - heaviside( t - upperb );
% 
% figtest = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     plot ( t, bsq );



%Bounded sinusoid

% k = 1;
% upperb =  ( ( 2*k -3) * T ) / K
% lowerb = -( ( 2*k -5) * T ) / K
% bsq = heaviside( t + lowerb ) - heaviside( t - upperb );
% 
% sk = cos( 2*pi * fk * t ) .* bsq;
% 
% figtest = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     plot ( t, sk );
%     plot ( t, bsq, '-k' );



% Sum of Bounding Square Waves

% k = 1;
% upperb =  ( ( 2*k -3) * T ) / K;
% lowerb = -( ( 2*k -5) * T ) / K;
% bsq = heaviside( t + lowerb ) - heaviside( t - upperb );
% 
% sbsq = 0 * t;
% 
% 
% figtest = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     
%     for k = 1:K
%         upperb =  ( ( 2*k -3) * T ) / K
%         lowerb = -( ( 2*k -5) * T ) / K
%         bsq = heaviside( t + lowerb ) - heaviside( t - upperb );
%         plot( t, k*bsq );
%         sbsq = sbsq + bsq;
%     end
%     
% %     plot ( t, sbsq );







    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    


