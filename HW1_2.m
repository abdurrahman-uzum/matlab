% EED1012 28 04 2020 Abdurrahman ÜZÜM 2019502099   

clear;
clc;

prompt = 'Enter integer number: ';
n = input(prompt);

i = 0;
sum = 0;

% Sum all integers starting from 0 to n and store it in sum variable
while i <= n  
    sum = sum + i;
    i = i + 1;
end

% Display sum
sum