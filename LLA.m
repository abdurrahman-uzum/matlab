clc
clear
n = 1.65;%ideally factor
Vt = 25.85*10^-3;%termal voltage
Id = 0 : 0.0005 : 20;%forward current
Is = 220 * 10^-12;%saturation current
Vd = n*Vt*log(((Id*10^-3)/Is)+1);%forward voltage

plot(Id , Vd , 'b');
hold on;
grid on;
y = 10 - 1/2*Id;
plot( Id, y , 'r');
xlim([0 20]);
ylim([0 1]);
xlabel('Id [mA]');
ylabel('Vd [V]');
legend( 'Diode Curve', 'Load Line', 'Location', 'northwest' );

VD = @(iD) n*Vt*log((iD*10^-3/Is)-1);
LL = @(iD) 10 - 1/2*iD;
f  = @(iD) -VD(iD) + LL(iD);

% fplot(VD);

[x, fval] = fzero(f,10)
VD(x)


% function y = VD(iD)
%     y = n*Vt*log((iD*10^-3/Is)-1);
% end
% 
% function y = LL(iD)
%     y = 10 - 1/2*iD;
% end

