function  y = f1(x)
Fa = 1.5;Fb = 0.5;Fd = 2.0;
Ta = 300;Tb = 300;
H = 10^6;h = 500;c = 5000;W = 500;
Ca = x(1);T = x(2);
k = 0.2*(1 - exp(1 - (T / 273)));
y(1) = ((((1 - Ca) / W)*Fa) - ((Ca / W)*Fb) - (Ca*k));
y(2) = ((((Ta - T) / W)*Fa) + (((Tb - T)/W)*Fb ) + (H / (c*W)) - ((h / c)*Ca*k));
%u=[0.0383 399.9288]
%u(1)=Cass;u(2)=Tss;
end
 



