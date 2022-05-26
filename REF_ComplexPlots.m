close all;
clear;
clc;

a = -1:0.05:1;
b = -1:0.05:1;

[A,B] = meshgrid(a,b);
z = A + 1j*B;

[theta, rho] = cart2pol(real(z), imag(z));
zz = rho.*exp(1j*theta);

y = zz;



surfc(a,b,abs(y));
xlabel('Real');
ylabel('Imag');
colormap jet;

% contour(real(y), imag(y));