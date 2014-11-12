clear;clc;f=myfunc;
global lamda 
lamda = [1; 1; 1];
%    v1in  v1out v2in v2out v3in v3out m11 m12 m21 m22 m31 m32  
% x0 = [45 45 45 45 45 45 25 25 25 25 25 25]; %section number 5
% x0 = [20 20 20 20 20 20 10 10 10 10 10 10]; %section number 5
x0=zeros(1,12);
lb1 = zeros(1,12);
ub1 = [45 45 45 45 45 45 25 25 25 25 25 25];

 %no coordination method 
[x_optnocoord,f_valnocoord] = fmincon( @f.p, x0, [], [], [], [], lb1, ub1);

%price method of coordination
[x1,f_val1] = fmincon( @f.p1p, x0, [], [], [], [], lb1, ub1);
v1in = x1(1); v1out = x1(2); m11 = x1(7); m12 = x1(8);

[x2,f_val2] = fmincon( @f.p2p, x0, [], [], [], [], lb1, ub1);
v2in = x2(3); v2out = x2(4);m21 = x2(9); m22 = x2(10);

[x3,f_val3]  = fmincon( @f.p3p, x0, [], [], [], [], lb1, ub1)
v3in = x3(5); v3out = x3(6); m31 = x3(11); m32 = x3(12);

x_optp=[v1in v1out v2in v2out v3in v3out m11 m12 m21 m22 m31 m32];
f_valp = f_val1 + f_val2 + f_val3

c = 0.01;N = 20;error = 0.01;number_of_iterations = 0;solution=1;
for i=1:1:N
    iterp = i;   
    lamda=lamda - c*[x_optp(2)-x_optp(3);x_optp(4)-x_optp(5);x_optp(6)-x_optp(1)];    
      
    [x1,f_valp1] = fmincon( @f.p1p, x0, [], [], [], [], lb1, ub1);
    v1in = x1(1); v1out = x1(2); m11 = x1(7); m12 = x1(8);
    
    [x2,f_valp2] = fmincon( @f.p2p, x0, [], [], [], [], lb1, ub1);
    v2in = x2(3); v2out = x2(4);m21 = x2(9); m22 = x2(10);
    
    [x3,f_valp3]  = fmincon( @f.p3p, x0, [], [], [], [], lb1, ub1);
    v3in = x3(5); v3out = x3(6); m31 = x3(11); m32 = x3(12);
   
    tmp = f_valp1 + f_valp2 + f_valp3;
    solution = abs(f_valp - tmp);
    f_valp = tmp;
    if(solution < error )
        break;
    end
end
x_optp=[v1in v1out v2in v2out v3in v3out m11 m12 m21 m22 m31 m32];
f_valp
number_of_iterations

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% direct method of coordination
% v1out=v2in;v2out=v3in;v3out=v1in;
x1 = fmincon( @f.p1d, x0, [], [], [], [], lb1, ub1 );
m11 = x1(7); m12 = x1(8);

x2 = fmincon( @f.p2d, x0, [], [], [], [], lb1, ub1 );
m21 = x2(9); m22 = x2(10);
 
x3 = fmincon( @f.p3d, x0, [], [], [], [], lb1, ub1 );
m31 = x3(11); m32 = x3(12);
 
% v1in  v1out v2out m11 m12 m21 m22 m31 m32
x0d = [25 25 25 m11 m12 m21 m22 m31 m32];
lbe = [0 0 0 m11 m12 m21 m22 m31 m32];
ube = [45 45 45 m11 m12 m21 m22 m31 m32];
 
[x_opt,f_val] = fmincon( @f.pd, x0d, [], [], [], [], lbe, ube )
f_vald=f_val;x_optd=x_opt;

%iteration part
decide = 0;
errord = 0.01;
N = 50;
for i=1:1:N
    x0d = x_opt;
    [x_optd, f_val] = fmincon(@f.pd, x0d, [], [], [], [], lb1, ub1);
    iterd = i;
    if((decide-f_val) < errord)
        break;
    end
    decide = f_val;
end





