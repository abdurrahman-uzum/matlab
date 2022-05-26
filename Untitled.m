clear;
clc;


t=0:0.00001;0.001;
Va=t;

for i=1 : length(t)
    Va(i)=2.5*sin( 2*pi*1000*t(i));
end

plot(t,Va,"b");