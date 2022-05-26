clear;
clc;

%% SPICE Parameters %%

Is   = 220*10^-12;
N    = 1.65;
Cj0  = 10;
M    = 0.5;
Vj   = 0.7;
Fc   = 0.5;
Cp   = 0.0;
Isr  = 0.0;
Nr   = 2.0;
Rs   = 0.0;
Tt   = 0.0;
Ikf  = 0;
Kf   = 0.0;
Af   = 1.0;
Ffe  = 1.0;
Bv   = 100;
Ibv  = 1*10^-3;
Temp = 26.85;
Xti  = 3.0;
Eg   = 1.11;
Tbv  = 0.0;
Trs  = 0.0;
Ttt1 = 0.0;
Ttt2 =  0.0;
Tm1  =  0.0;
Tnom = 26.85;
Area = 1;

% Additional:
Vt   = 25.85*10^-3;
Ibvl = 0;
Nbv  = 0;
Nbvl = 0;

%
Vd = 0 : 0.01 : 10;

%% Equations %%

I_nrm = Is * exp( (Vd / (N*Vt)) -1 );
K_inj = ( Ikf ./ (Ikf + I_nrm) ).^0.5;
I_rec = Isr * exp( (Vd / (Nr*Vt)) -1 );
K_gen = ( 0.005 + ( (1-Vd)/Vj ).^2 ).^(M/2);

I_fwd = (I_nrm .* K_inj) + (I_rec .* K_gen);


I_revh = Ibv * exp( -( (Vd + Bv)/Nbv*Vt) );
I_revl = Ibvl * exp( -( (Vd + Bv)/Nbvl*Vt) );

I_rev = I_revh + I_revl;


I_d = Area * ( I_fwd - I_rev );


%% Plot %%



plot(Vd, I_d, 'r');
xlabel('{\itV}');
ylabel('{\iti}');

hold on

y = -(Vd-10)/500 ;
plot(Vd, y, 'b');

grid on






