clc;clear all;
k2=0.02;k3=0.03;k4=0.04;k5=0.05;k6=0.06;k7=0.07;k8=0.08;
i0=0.10;i1=0.11;i2=0.12;i4=0.14;i5=-0.15;i6=0.16;ub = inf(20,1);lb = zeros(20,1);
% spo sdo sho sca scb scc scd  sg  sp do1 do2 do3 cpo cdo cho uo1 uo2 uo3 udc ucc
A=[0   0   0   0   0   0   0   0   0   1   0   0   0   0   0   1   0   0   0   0;
   0   0   0   0   0   0   0   0   0   0   1   0   0   0   0   0   1   0   0   0;
   0   0   0   0   0   0   0   0   0   0   0   1   0   0   0   0   0   1   0   0;
   0   0   0   0   0   0   0   0   0   1   1   1   0   0   0   0   0   0   1   0;
   0   0   0   0   0   0   0   0   0   0   0   0   1   1   1   0   0   0   0   1;
   0   0   0   0   0   0   0  -1   i5   k2   k3   k4   i2   i6   i4   0   0   0   0   0;
   0   0   0   -1   0   0   0 -1   -i0   k2   k2   k3   k6   i2   i0   0   0   0   0   0;
   0   0   0   0   -1   0   0  0   -0.25   k3   k4   k5   k4   k4   k4   0   0   0   0   0;
   0   0   0   0   0   -1   0  0   -0.3   k4   k5   k8   0.4   0.2   0.3   0   0   0   0   0;
   0   0   0   0   0   0   -1  0   -0.2   k4   k6   k5   k6   0.28   0.3   0   0   0   0   0;
   0   0   1   0   0   0   0   0   0   -0.1   -k7   -i4   0.6   -0.2   1   0   0   0   0   0;
   0   1   0   0   0   0   0   0   0   -0.2   -i2   -i1   0   1   0   0   0   0   0   0;
   1   0   0   0   0   0   0   0   0   -0.55   -0.61   -0.5   1   0   0   0   0   0   0   0];
B=[9500 8500 8500 14000 3500 0 0 0 0 0 0 0 0];
B=transpose(B);
for i=0.1:0.1:8 %do1=i
     j=1.5;k=1.6;
     C=[1.8 4.0 4.2 4.3 4.2 4.1 4.0 3.3 5.5 -(0.4+i) -(0.4+j) -(0.4+k) -i6 -0.21 -0.21 0 0 0 0 0];
     [X,Fvalneg] = linprog(-C, [], [], A, B, lb, ub);
     profit1(round(i*10)) = -Fvalneg;
     moilcoefficient1(round(i*10)) = i;end
for j=0.1:0.1:8 %do2= j 
     i=1.4;k=1.6;
     C=[1.8 4.0 4.2 4.3 4.2 4.1 4.0 3.3 5.5 -(0.4+i) -(0.4+j) -(0.4+k) -i6 -0.21 -0.21 0 0 0 0 0];
     [X,Fvalneg] = linprog(-C, [], [], A, B, lb, ub);
     profit2(round(j*10)) = -Fvalneg;
     moilcoefficient2(round(j*10)) = j;end
for k=0.1:0.1:8%do3=k
     i=1.4;j=1.5;
     C=[1.8 4.0 4.2 4.3 4.2 4.1 4.0 3.3 5.5 -(0.4+i) -(0.4+j) -(0.4+k) -i6 -0.21 -0.21 0 0 0 0 0];
     [X,Fvalneg] = linprog(-C, [], [], A, B, lb, ub);
     profit3(round(k*10)) = -Fvalneg;
     moilcoefficient3(round(k*10)) = k;end

plot(moilcoefficient1,profit1,'-',moilcoefficient2, profit2,'-',moilcoefficient3, profit3,'-');
legend('Oil1','Oil2','Oil3');
xlabel('market oil coefficients')
ylabel('Profit')
title('market oil prices effect')


% spo sdo sho sca scb scc scd  sg  sp do1 do2 do3 cpo cdo cho uo1 uo2 uo3 udc ucc
% C=[1.8 4.0 4.2 4.3 4.2 4.1 4.0 3.3 5.5 -1.8 -1.9 -2 -i6 -0.21 -0.21 0 0 0 0 0];
% C=transpose(C);
% [X,Fvalneg] = linprog(-C, [], [], A, B, lb, ub)
% Fval = - Fvalneg
% s_po = X(1)
% s_do = X(2)
% s_ho = X(3)
% s_cA = X(4)
% s_cB = X(5)
% s_cC = X(6)
% s_cD = X(7)
% s_g = X(8)
% s_p = X(9)
% d_oI = X(10)
% d_oII = X(11)
% d_oIII = X(12)
% c_po = X(13)
% c_do = X(14)
% c_ho = X(15)
% u_oI = X(16)
% u_oII = X(17)
% u_oIII = X(18)
% u_dc = X(19)
% u_cc = X(20)
