%% Clean up %%
clear;
clc;

%% Set parameters: %%

% x-axis (time):
t = 0 : 0.001 : 0.1; 

% frequencies
f1 = 25;
f2 = 50;

% amplitudes
A1 = 3;
A2 = 2;

% equations
y1 = A1*sin( 2*pi*f1*t );
y2 = A2*cos( 2*pi*f2*t );

%% Plot %%

plot(t, y1, 'r');
hold on
plot(t, y2, 'b');

grid on

