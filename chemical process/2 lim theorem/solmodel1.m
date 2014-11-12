f=model;
clc;clear;
global k1 k2 k3
k1=0.17;k2=0.02;k3=0.23;
initial=[10 10 0 0];tspan=0:0.1:35;f=model;   
[tout,yout]=ode45(@f.biochemical,tspan,initial);
figure(1)
f.Plotchemical(tout,yout)

h=0.01; 
yout_1=yout;  
k1=k1+h; 
[tout,yout]=ode45(@f.biochemical,tspan,initial); 
yout_k1=(yout-yout_1)./h;
  
k1=k1-h; 
k2=k2+0.01; 
[tout,yout]=ode45(@f.biochemical,tspan,initial); 
yout_k2=(yout-yout_1)./h;
  
k2=k2-h; 
k3=k3+0.01; 
[tout,yout]=ode45(@f.biochemical,tspan,initial); 
yout_k3=(yout-yout_1)./h;


figure(2)
youtS=[yout_k1(:,1),yout_k2(:,1),yout_k3(:,1)];
f.Plotchemicalim(tout,youtS)
figure(3)
youtE=[yout_k1(:,2),yout_k2(:,2),yout_k3(:,2)];
f.Plotchemicalim(tout,youtE)
figure(4)
youtC=[yout_k1(:,3),yout_k2(:,3),yout_k3(:,3)];
f.Plotchemicalim(tout,youtC)
figure(5)
youtP=[yout_k1(:,4),yout_k2(:,4),yout_k3(:,4)];
f.Plotchemicalim(tout,youtP)
