clear;
clc;

%% Parameters %%
Vj = 0.7;
Is = 220*10^-12;
n  = 1.65;
Vt = 25.85*10^-3;

R = 2200;

%%

t = 0:0.000001:0.001;
Vi = 4*sin(1000*2*pi*t);
Vd = zeros( 1, length(t) );
Vr = zeros( 1, length(t) );
I  = zeros( 1, length(t) );

for i=1 : length(t)
    if ( Vi(i) > 0.7 )
        Vd(i) = 0.7;
    else
        Vd(i) = Vi(i);
    end
end
        


for i=1 : length(t)
    if ( Vd(i) >= 0 )
       I = Is*( exp(Vd ./ (n*Vt)) -1 ) + ( Vi - Vd ) / R;
    else
        I(i) = 0;
    end
end


Vr = I.*R;



%%
hold on;

%plot( t, Vi, 'black' );

%plot( t, Vr, 'g' );

%plot( t, Vd, 'b' );

plot( t, I, 'r' );



grid on;















