classdef model    
 methods (Static)
    function Dy = biochemical(t,y)
        % constants chemical process
        k1=0.17;k2=0.02;k3=0.23;
        S=y(1);E=y(2);C=y(3);P=y(4);
        Dy=[-k1*S*E+k2*C;
            -k1*S*E+(k2+k3)*C;
            k1*S*E-(k2+k3)*C;
            k3*C];end    
    function biosolver
    initial=[10 10 0 0];tspan=0:0.1:35;f=model;   
    [tout,yout]=ode45(@f.biochemical,tspan,initial);
    f.Plotchemical(tout,yout)
    end
    function Plotchemical(T,Y)
        grid on
    plot(T,Y(:,1),'-',T,Y(:,2),'-',T,Y(:,3),'-',T,Y(:,4),'-'); grid on;
    title('Chemical process');xlabel('Time');ylabel('S(t), E(t), C(t), P(t)');
    legend('S:Substrate','E:Enzyme','C:Component','P:Product');end
    end
end
 
