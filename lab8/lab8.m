clc;clear;
%constants
tfinal = 10;
tstep = 0.1;
d = zeros(1, 101);
u = zeros(size(d));
e_1 = zeros(size(d));
t = (0:tstep:tfinal);
c = 0.07;
error = 0;
stop_criter = 15;
max_iter = 500;
counter = 0;

% Obtain trajectory 
for i=1:1:round(0.3*length(d))
    d(i) = 0;
end
for i=round(0.3*length(d) + 1):1:round(0.7*length(d))
    d(i) = -3.0;
end
for i=round(0.7*length(d) + 1):1:length(d)
    d(i) = 0;
end

% Plot trajectory 
plot(t,d);
xlabel('Time [s]');
ylabel('d(t)');
axis([0 10 -4 1]);

% loop part for calculating 
for index=1:1:max_iter
    counter = index;
    sim('model8',[0 tfinal]);    
    e_1 = flipud(e);    
    sim('adjoint',[0 tfinal]);    
    beta_1 = flipud(beta);    
    for i=1:1:length(u)
        u(i) = u(i) - c*beta_1(i);
    end
    error = sum(abs(e));    
    if (error < stop_criter)
        break;
    end
end
counter
error