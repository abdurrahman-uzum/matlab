close all;
clear;

data = csvread( "MASC0000.CSV", 4 );

%t = linspace( 0, 5e-3, 10000 );

t = data(:,1);
y = data(:,2);

plot( t, y );