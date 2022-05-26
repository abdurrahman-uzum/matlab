clear;
close all;
clc;

n = 1.45;
V_T = 25*10^-3;
I_S = 76.9*10^-12;

i  = linspace(0, 5*10^-3, 1000);
V = @(i) n*V_T * log( 1 + i/I_S );
imes = linspace(0, 5*10^-3, 20);
Vmes = V(imes);
Vmes = Vmes + 0.05*( 2*rand(1,length(Vmes)) -1 );
Vmes(1)=0;

myfit = fittype('a*log(1 + b*x)',...
'dependent',{'y'},'independent',{'x'},...
'coefficients',{'a','b'});
fitted = fit(imes',Vmes',myfit);
coef = coeffvalues(fitted);
a = coef(1);
b = coef(2);
est = a*log(1+b*i);

hold on;
xlim([-2*10^-3, 5*10^-3]);
ylim([-0.2,1]);
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';

plot(i, V(i), 'b');
plot(i, est, 'g');
scatter(imes, Vmes);




