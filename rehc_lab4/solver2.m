clear;
clc;
% format shortG;

global lambda vector
lambda = [1; 1; 1];
A = [0 1 -1 0 0 0; 0 0 0 1 -1 0; -1 0 0 0 0 1];

x0 = [14 14 14 14 14 14 25 25 25 25 25 25];
lb = [0 0 0 0 0 0 0 0 0 0 0 0];
ub = [28 28 28 28 28 28 50 50 50 50 50 50];

[x_opt1, f_val1] = fmincon(@p1_neg, x0, [], [], [], [], lb, ub);
m11 = x_opt1(1);
m12 = x_opt1(2);
v1in = x_opt1(7);
v1out = x_opt1(8);

[x_opt2, f_val2] = fmincon(@p2_neg, x0, [], [], [], [], lb, ub);
m21 = x_opt2(3);
m22 = x_opt2(4);
v2in = x_opt2(9);
v2out = x_opt2(10);

[x_opt3, f_val3] = fmincon(@p3_neg, x0, [], [], [], [], lb, ub);
m31 = x_opt3(5);
m32 = x_opt3(6);
v3in = x_opt3(11);
v3out = x_opt3(12);

f_val = f_val1 + f_val2 + f_val3;

c = 0.1;
N = 100;
error = 0.01;
solution = 1;
number_of_iterations = 0;
for i=1:1:N
    number_of_iterations = i;
    if(solution < error)
        break;
    end
    lambda = lambda - c*[v1out - v2in; v2out - v3in; v3out - v1in];
    
    x0 = [v1in v1out v2in v2out v3in v3out m11 m12 m21 m22 m31 m32 ];
    lb = [0 0 0 0 0 0 0 0 0 0 0 0];
    ub = [28 28 28 28 28 28 50 50 50 50 50 50];
    
    [x_opt1, f_val1] = fmincon(@p1_neg, x0, [], [], [], [], lb, ub);
    m11 = x_opt1(1);
    m12 = x_opt1(2);
    v1in = x_opt1(7);
    v1out = x_opt1(8);
    
    [x_opt2, f_val2] = fmincon(@p2_neg, x0, [], [], [], [], lb, ub);
    m21 = x_opt2(3);
    m22 = x_opt2(4);
    v2in = x_opt2(9);
    v2out = x_opt2(10);
    
    [x_opt3, f_val3] = fmincon(@p3_neg, x0, [], [], [], [], lb, ub);
    m31 = x_opt3(5);
    m32 = x_opt3(6);
    v3in = x_opt3(11);
    v3out = x_opt3(12);
    
    tmp = f_val1 + f_val2 + f_val3;
    solution = abs(f_val - tmp);
    f_val = tmp;
end

m11 = x_opt1(1)
m12 = x_opt1(2)
m21 = x_opt2(3)
m22 = x_opt2(4)
m31 = x_opt3(5)
m32 = x_opt3(6)
v1in = x_opt1(7)
v1out = x_opt1(8)
v2in = x_opt2(9)
v2out = x_opt2(10)
v3in = x_opt3(11)
v3out = x_opt3(12)
lambda
f_val
number_of_iterations

% x0 = [m11 m12 m21 m22 m31 m32 25 25 25];
% lb_coord = [m11 m12 m21 m22 m31 m32 0 0 0];
% ub_coord = [m11 m12 m21 m22 m31 m32 50 50 50];
%
% [x_opt, f_val] = fmincon(@p, x0, [], [], [], [], lb_coord, ub_coord);
% m11 = x_opt(1)
% m12 = x_opt(2)
% m21 = x_opt(3)
% m22 = x_opt(4)
% m31 = x_opt(5)
% m32 = x_opt(6)
% v12 = x_opt(7)
% v23 = x_opt(8)
% v31 = x_opt(9)
%
% f_val


% N = 100;
% error = 0.001;
% for number_of_iterations=1:1:N
%     x0 = x_opt
%     result = f_val;
%     [x_opt, f_val] = fmincon(@p, x0, [], [], [], [], lb, ub);
%     if((result-f_val) < error)
%         break;
%     end
% end
%
% f_val
% number_of_iterations






