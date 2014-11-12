function y = f2(x)
global Td Cad;Cad=0.05;Td=400; 
Fa = 1.5;Fb = 0.5;
Ta = 300;Tb = 300;
h = 500;c = 5000;Wd = 500;
Fd = x(1);H = x(2);
k = 0.2*(1 - exp(1 - (Td / 273)));
y(1) = (Fa - (Cad*Fd) - (Wd*Cad*k));
y(2) = ((c*Fa*Ta) + (c*Fb*Tb) - (c*Fd*Td) + H - (h*Wd*Cad*k));
%u=[-7.1991e+000 -1.7397e+007]
%u(1)=Fdss;u(2)=Hss;
end