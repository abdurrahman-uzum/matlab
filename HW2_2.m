%% Algorithm %%
% To achieve desired goal, digits of the number must be seperated.
%
% For 3 digit numbers:
%
%   Leftmost digit can be obtained by dividing the number by 100
%   and discarding the decimal place.
%       e.g. 542 / 100 = 5.42 --> 5
%
%   Middle digit can be obtained by first discarding the leftmost digit by
%   taking the remainder of division by 100, then dividing by 10 and 
%   discarding decimal place.
%       e.g. rem. of. 421 / 100 = 21
%            21 / 10 = 2.1 --> 2
%
%   Right most digit is simply remainder of division by 10.
%       e.g. rem. of 123 / 10 = 3
%
% Loop through all 3 digit numbers, and apply this algorithm for each.
%
% If the relative number satisfies the given condition, store it in a
% vector, if the third number still haven't been found.
%%%

%% clean up %%
clear;
clc;

%% initialize %%
v = [0, 0, 0];
it = 1;

%% calculate %%
%scan through all 3 digit numbers
for i=100 : 999
    d1 = floor( i/100 );            %obtain leftmost digit
    d2 = floor( rem(i,100)/10 );    %obtain middle digit
    d3 = rem(i,10);                 %obtain rightmost digit
    
    %check if the sum of cubes of the digits is equal to number itself
    %and if still haven't found the 3rd number
    if ( (d1^3 + d2^3 + d3^3) == i && it < 4 )
        %if condition is satisfied, store the number in a vector
        v(it) = i;        
        %move to the next index of vector
        it = it + 1;
    end;
end;

%% display %%
v
        
        