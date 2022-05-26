%% Clean up %%
clear;
clc;

%% Set parameters: %%

% x-axis-1:
x = -1.5 : 0.01 : 1.5; 

% x-axis-2 (time):
t = 0 : 0.001 : 0.1;

% frequencies
f = 50;

% equations
y1 = x.^2;
y2 = exp(x);
y3 = sin(2*pi*f*t).*exp(-30*t);

%% Plot %%
figure(2);

subplot(2,1,1);

plot(x, y1, 'b');
hold on;
plot(x, y2, 'k');

xlabel('x');
ylabel('y');
legend("y=x^2", "y=e^x", "Location", "Northwest");
grid on

subplot(2,1,2);
plot(t, y3, 'g');

xlabel("time(sec)");
ylabel("amplitude");
legend("y=sin(2\pift)e^{-30t}");
grid on;

