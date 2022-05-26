%% Clean up %%
clear;
clc;

%% Set parameters: %%

% x-axis (time) %
t = -0.5 : 0.001 : 0.5;

% frequencies %
f = 50;

% equations %
%fig #1:
y1 = sin(2*pi*5*t);
y2 = t.^2;

%fig #2:
y3 = exp(t);

%% Plot %%
figure(2);

% plot figure #1 %
subplot(2,1,1);

plot(t, y1, 'b');
hold on;
plot(t, y2, 'r*');

title( "Sinusoidal and quadratic function" );
xlabel('t');
legend("y=x^2", "y=e^x");
grid on


% plot figure #2 %
subplot(2,1,2);
plot(t, y3, 'b');

title( "Exponential function" );
xlabel('t');
legend("e^t");
grid on;

