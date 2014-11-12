clear;clc;f=myfun;%section number 5
%without any coordination method

lb1 = [0 0 0 0 0 0 0 0 0];ub1 = [45 45 45 25 25 25 25 25 25];
% x0 = [25 25 25 10 10 10 10 10 10];
% x0 = [1 1 1 1 1 1 1 1 1];
% x0 = [25 25 25 25 25 25 25 25 25];
x0 = [45 45 45 25 25 25 25 25 25];
[x_optnocoord,f_valnocoord] = fmincon( @f.p, x0, [], [], [], [], lb1, ub1 )

% % direct method of coordination
% %     v12 v23 v31 m11 m12 m21 m22 m31 m32
x1 = fmincon( @f.p1, x0, [], [], [], [], lb1, ub1 );
m11_opt = x1(4);m12_opt = x1(5);

x2 = fmincon( @f.p2, x0, [], [], [], [], lb1, ub1 );
m21_opt = x2(6);m22_opt = x2(7);

x3 = fmincon( @f.p3, x0, [], [], [], [], lb1, ub1 );
m31_opt = x3(8);m32_opt = x3(9);

x0 = [25 25 25 m11_opt m12_opt m21_opt m22_opt m31_opt m32_opt];
lbe = [0 0 0 m11_opt m12_opt m21_opt m22_opt m31_opt m32_opt];
ube = [45 45 45 m11_opt m12_opt m21_opt m22_opt m31_opt m32_opt];

[x_opt,f_val] = fmincon( @f.p, x0, [], [], [], [], lbe, ube )
f_vald=f_val;x_optd=x_opt;

%iteration part
decide = 0;
error = 3;
N = 100;
for i=1:1:N
    x0 = x_opt;
    [x_opt, f_val] = fmincon(@f.p, x0, [], [], [], [], lb1, ub1);
    number_of_iterations = i;
    if((decide-f_val) < error)
        break;
    end
	decide = f_val;
end

x_opt
f_val
number_of_iterations

