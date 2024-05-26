close all;
clear;
clc;

T = 5e-6;

fc = 1500;

fft_fs = 100 * fc;
Ts = 1/fft_fs;
nfft = 2^13;

t = linspace( -2*T, 2*T, (4*T)/Ts );
fft_f  = linspace( -fft_fs/2, fft_fs/2, nfft );

% s = sinc( 100 * t );
c = cos( 2*pi*fc*t );

k = 5;
fm = 100e3;
sig = cos( 2*pi*(2*k-1)*fm*t );



% phi = s .* c;
% 
% phi_fft = fftshift( abs( fft( phi, nfft ) ) );
% c_fft = fftshift( abs( fft( c, nfft ) ) );
% 
% 
% %%
% fsig = figure( 'WindowStyle', 'Docked' );
% 
%     subplot( 2, 1, 1 );
%     hold on; grid on; grid minor;
%     plot( t, s );
% 
%     subplot( 2, 1, 2 );
%     hold on; grid on; grid minor;
%     plot( t, c );
% 
% 
% fphi = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
%     plot( t, phi );
% 
% 
% fig_fft = figure( 'WindowStyle', 'Docked' );
%     hold on; grid on; grid minor;
% 
%     plot( fft_f, phi_fft ); 


%% lab


for i = 2 : k
    sig = sig + i * cos( 2*pi*(2*i-1)*fm*t );
end

phi_sig = sig .* c;

fft_phi_sig = fftshift( abs( fft( phi_sig, 2^13 ) ) );

fig_labsig = figure( 'WindowStyle', 'Docked' );
    subplot( 2,1,1);
    hold on; grid on; grid minor;
    plot( t, sig );

    subplot( 2,1,2);
    hold on; grid on; grid minor;
    plot( t, phi_sig );
    
    
fig_enveloped = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    [upper, lower] = envelope( phi_sig );
    plot( t, phi_sig );
    plot( t, upper );
    plot( t, lower );


fig_labsig_fft = figure( 'WindowStyle', 'Docked' );
    hold on; grid on; grid minor;
    plot( fft_f, fft_phi_sig );








 