%% clean up %%
clear;
clc;

%% initialize %%
X = [0.3, 2, -1, 4, -5, 0.1, 8, 3.4, 7, -2.3 ];
P = 0;
N = 0;

%% calculate %%
for i=1 : length(X)
    if ( X(i) < 0 )
        N = N + 1;
    else if ( X(i) > 0 )
            P = P + 1;
        end;
    end;
end;

%% display %%
N
P