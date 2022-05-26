%% Clean up %%
clear;
clc;

%% Set parameters: %%

% equations
Is = 220*10^-12;
n  = 1.65;
Vt = 25.85*10^-3;
Vd = 0.79;

R = 500;

% x-axis (voltage):
v = 0 : 0.01 : 10;
I = 0 : 0.01 : 10;

for i = 1 : length(v)
    if ( v(i) <= Vd )             
        I(i) = Is*( exp(v(i) /(n*Vt)) -1 );
    else
        I(i) = Is*( exp(Vd /(n*Vt)) -1 ) + ( v(i) - 0.7 ) / R;
    end
end
        
        
        
        
%% Plot %%

plot(v, I, 'r');
ylim([0,0.024]);
xlabel('{\itV}');
ylabel('{\iti}');

hold on

y = -(v-10)/500 ;
plot(v, y, 'b');





grid on
