% EED1012 28 04 2020 Abdurrahman ÜZÜM 2019502099 

clear;
clc;

V = 2*rand(1,10) - 1;

%Initial min value must be guaranteed to be bigger than any possible
%elements of the vector.
min = 999;

for i = 1:length(V)
    if V(i) < min    %If the current element of the vector is bigger than min
        min = V(i);  %Set it to be the new min.
    end
end

%Display min
min