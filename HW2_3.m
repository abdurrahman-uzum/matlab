%% clean up %%
clear;
clc;

%% initialize %%
r = 500*rand(1,50); %random vector of resistors
i = 1;              %iterator
R_eq = 0;           %equivalent resistance

%% calculate %%
while i <= 50
    %by the formula: 1/R_eq = 1/R1 + 1/R2 + ... + 1/Rn
    R_eq = R_eq + 1/r(i);
    i = i + 1;
end;

%The result is multiplicative inverse of equivalent resistance, to fix:
R_eq = 1/R_eq;

%% display %%
R_eq
