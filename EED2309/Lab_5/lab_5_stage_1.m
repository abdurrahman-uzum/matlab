clear;
clc;

t = 0:0.000001:0.002;

Vi = 4*sin(1000*2*pi*t);
Vr = Vi - 0.7;
Vd = t.*0;

for i=1 : length(t)
    
    if( Vr(i) < 0)
       Vr(i)=0;
    end
    
end


for i=1 : length(t)
    
   Vd(i)=4*(sin(1000*2*pi*t(i)));
   if ( Vd(i) > 0.7 ) 
       Vd(i) = 0.7;
   end
   
   if( Vd(i) < 0)
       Vd(i)=0;
   end
   
end

plot(t,Vr,"r");

hold on;

plot(t,Vd,"b");

hold on;

plot ( t, Vi, 'g' );
