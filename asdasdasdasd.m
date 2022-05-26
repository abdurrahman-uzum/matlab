x = -100:100;
y = x.^3;

xt = x;
xt(xt>0) = log10(1+xt(xt>0));
xt(xt<0) = -log10(1-xt(xt<0));

figure;
ax = axes;
plot(xt,y);
set(ax, 'XTick', [-2 -1 0 1 2], ...
    'XTickLabel', {'-100', '-10', '0', '10', '100'});