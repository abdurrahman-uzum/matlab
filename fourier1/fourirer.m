close all;
clear;
clc;

t = linspace(0, 10, 1001);
% t=ones(1,1001);

fsig1 = 5; 

frot = linspace(4, 6, 1001);

sig1 = cos(2*pi*fsig1*t);



%%

f1 = figure('WindowStyle', 'Docked');

hold on;
grid on;
axis('square');
xlim([-1.5, 1.5]);
ylim([-1.5, 1.5]);

z = sig1 .* exp(frot(1) * 2*pi*1i * t);
plt = plot(z, 'k');

for k=1 : length(frot)
   frot(k)
   z = sig1 .* exp(frot(k) * 2*pi*1i * t);
   
   set(plt, 'xdata', real(z) );
   set(plt, 'ydata', imag(z) );
   
   drawnow

   pause(1);
   %delete(plt);
end








