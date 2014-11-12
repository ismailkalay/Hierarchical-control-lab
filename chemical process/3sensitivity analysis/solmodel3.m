clc;clear;
 f=model3;
initial=[10 10 0 0 0 0 0 0];tspan=0:0.1:35;   
global k1v k2v k3v
k1v=1;k2v=0;k3v=0;
[tout,youtk1]=ode45(@f.biochemical,tspan,initial);
k1v=0;k2v=1;k3v=0;
[tout,youtk2]=ode45(@f.biochemical,tspan,initial);
k1v=0;k2v=0;k3v=1;
[tout,youtk3]=ode45(@f.biochemical,tspan,initial);
figure(1)
yout=[youtk1(:,5),youtk2(:,5),youtk3(:,5)];
f.Plotchemical(tout,yout)
figure(2)
yout=[youtk1(:,6),youtk2(:,6),youtk3(:,6)];
f.Plotchemical(tout,yout)
figure(3)
yout=[youtk1(:,7),youtk2(:,7),youtk3(:,7)];
f.Plotchemical(tout,yout)
figure(4)
yout=[youtk1(:,8),youtk2(:,8),youtk3(:,8)];
f.Plotchemical(tout,yout)