clearvars; clc;
T=10^(-3); %Duration parameter 
f=8*10^3;  %frequency f0
Fs=40*f;   %Sampling frequency
Ts=1/Fs;   %Sampling period
NFFT=2^13; %FFT size tuning frequency resolution delta_f = Fs/NFFT
t=linspace(-2*T,2*T,(4*T)/Ts); %Time axis vector between t -> [-2T, 2T]
f_axis=linspace(-Fs/2,Fs/2,NFFT); % Frequency axis vector between f -> [-Fs/2 , Fs/2]
s1=cos(2*pi*(4*f)*t);
s2=cos(2*pi*f*t);
%----------- STEP 1 -----------------------------
subplot(311)
plot(t,s1,'b','LineWidth',2); grid on; ylim([-2 2]); 
subplot(312)
sq1=heaviside(t); plot(t,sq1,'b','LineWidth',2); grid on; ylim([-1 2]); 
subplot(313)
st1=sq1.*s1; plot(t,st1,'b','LineWidth',2); grid on; ylim([-2 2]);  hold on;

figure
subplot(311)
plot(t,s2,'r','LineWidth',2); grid on; ylim([-2 2]); 
subplot(312)
sq2=heaviside(-t); plot(t,sq2,'r','LineWidth',2); grid on; ylim([-1 2]);
subplot(313)
st2=sq2.*s2; plot(t,st2,'r','LineWidth',2); grid on; ylim([-2 2]);  hold on;

figure
s=st1+st2; %generate required sinusoidal signal
plot(t,s,'k','LineWidth',2); grid on; ylim([-2 2]); 

%----------- Time Domain Operations -----------------------------
subplot(311)
plot(t,s,'k','LineWidth',2); grid on; ylim([-2 2]); 
subplot(312)
s_sq=1-(heaviside(t+T) - heaviside(t-T)); %generate required square waveform
%s_sq=heaviside(t+T);
%s_sq=heaviside(t-T);
plot(t,s_sq,'k','LineWidth',2); grid on; ylim([0 2]); 
subplot(313)
sp=s .* s_sq + s_sq;
plot(t,sp,'k','LineWidth',2); grid on; ylim([-2 2]); 
%----------- Frequency Domain Operations -----------------------------
figure
F_sig1=fft(st1,NFFT);
subplot(311);
plot(f_axis,fftshift(abs(F_sig1)),'b','LineWidth',2);
grid on; hold on;

F_sig2=fft(st2,NFFT); subplot(311); plot(f_axis,fftshift(abs(F_sig2)),'r','LineWidth',2); grid on;
F_sig=fft(s,NFFT); subplot(311); plot(f_axis,fftshift(abs(F_sig)),'k','LineWidth',2); grid on;

F_sq=fft(s_sq,NFFT); subplot(312); plot(f_axis,fftshift(abs(F_sq)),'k','LineWidth',2); grid on;
F_prod=fft(sp,NFFT); subplot(313); plot(f_axis,fftshift(abs(F_prod)),'k','LineWidth',2); grid on;

F_sq_theo=4*T*sinc(4*f_axis*T)-2*T*sinc(2*f_axis*T);

figure;
subplot(211); plot(f_axis,fftshift(abs(F_sq)),'k','LineWidth',2); grid on;
subplot(212); plot(f_axis,abs(F_sq_theo),'k','LineWidth',2); grid on;