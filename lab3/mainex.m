clear
clc;f=myfun;
% x0 = [10 10 10];% solution: x_opt = [10 5 5];f_val = -150;
% % x0 = [5 2.5 5]; % solution: x_opt = [10 1 5];f_val = -166;
% [x_opt,f_val] = fmincon(@f.p, x0, [], [], [], [], [2 1 1], [10 5 5])

x0 = [5 2.5 5]; % solution: x_opt = [10 2.5 5];f_val = -1.5625e+002;
% x0 = [10 2.5 5];  % solution: x_opt = [10 1 5];f_val = -166;
lb1 = [x0(1) 1 1];ub1 = [x0(1) 5 5];%v = x0(1)
x1 = fmincon( @f.p1, x0, [], [], [], [], lb1, ub1 );
m1_opt = x1(2);
lb2 = [x0(1) m1_opt 1];ub2 = [x0(1) m1_opt 5];%now v and m1 constant
x2 = fmincon(@f.p2, x0, [], [], [], [], lb2, ub2 );
m2_opt = x2(3);
lb_coord = [2 m1_opt m2_opt];ub_coord = [10 m1_opt m2_opt];
[x_opt,f_val] = fmincon(@f.p, x0, [], [], [], [], lb_coord, ub_coord )
