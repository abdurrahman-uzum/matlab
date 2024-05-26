close all;
clear;
clc;

%% BERNAULLI TRIALS WITH VARYING TRIAL COUNT %%
k = 150;
n = [ k : 1000 ];

p = 0.25;


% Binomial coef calc.. Doesnt work with large numbers, duh...
% nk = ( factorial(n) ./ ( factorial(k) * factorial(n-k) ) );

% Smarter binomial coef. calculation. 
log_nk = gammaln( n + 1 ) - ( gammaln( k + 1 ) + gammaln( n - k + 1 ) );
% nk = factorial(n) ./ (factorial(k) * factorial(n - k) );

% BERNAULLI TRIALS %
% y = nk .* p^k .* (1-p).^(n-k);
yy = exp( log_nk ) .* p^k .* (1-p).^(n-k);
max(yy)

fig = figure( 'WindowStyle', 'Docked' );
hold on;
grid on;
xlim( [0 n(end)] );
% ylim( [0 1] );
% plot ( n, y );
plot( n, yy );


%% BERNAULLI TRIALS WITH VARYING SUCCESS COUNT %%
% n = 1000;
% k = [ 0: n ];
% 
% p = 0.5;
% 
% 
% % Binomial coef calc.. Doesnt work with large numbers, duh...
% % nk = ( factorial(n) ./ ( factorial(k) * factorial(n-k) ) );
% 
% % Smarter binomial coef. calculation. 
% log_nk = gammaln( n + 1 ) - ( gammaln( k + 1 ) + gammaln( n - k + 1 ) );
% % nk = factorial(n) ./ (factorial(k) * factorial(n - k) );
% 
% % BERNAULLI TRIALS %
% % y = nk .* p^k .* (1-p).^(n-k);
% yy = exp( log_nk ) .* p.^k .* (1-p).^(n-k);
% 
% fig = figure( 'WindowStyle', 'Docked' );
% hold on;
% grid on;
% xlim( [0 k(end)] );
% % ylim( [0 1] );
% % plot ( n, y );
% plot( k, yy );


