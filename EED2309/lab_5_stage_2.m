clear;
clc;

t = 0:0.00001:0.004;

Vi = 4*sin(1000*2*pi*t);

Vr = t;
Vd = t;


for i=1:length(t)
    Vr(i) = ((4*(sin(1000*2*pi*t(i))))+0.7);
    
    if( Vr(i) > 0)
       Vr(i)=0;
   end
    
end


for i=1:length(t)
    
   Vd(i)=4*(sin(1000*2*pi*t(i)));
   if ( Vd(i) < -0.7 ) 
       Vd(i) = -0.7;
   end
   
   if( Vd(i) > 0)
       Vd(i)=0;
   end
   
end

plot(t,Vr,"r");

hold on;

plot(t,Vd,"b");

hold on;

plot ( t, Vi, 'g' );
