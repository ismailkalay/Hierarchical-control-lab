classdef model    
 methods (Static)
    function Dy = biochemical(t,y)
        % constants chemical process       
        global k1 k2 k3
        S=y(1);E=y(2);C=y(3);P=y(4);
        Dy=[-k1*S*E+k2*C;
            -k1*S*E+(k2+k3)*C;
            k1*S*E-(k2+k3)*C;
            k3*C];end    

   
    function Plotchemical(T,Y)
        
    plot(T,Y(:,1),'-',T,Y(:,2),'-',T,Y(:,3),'-',T,Y(:,4),'-');grid on
    title('Chemical process');xlabel('Time');ylabel('S(t), E(t), C(t), P(t)');
    legend('S:Substrate','E:Enzyme','C:Component','P:Product');end
   function Plotchemicalim(T,Y)
    plot(T,Y(:,1),'-', T,Y(:,2),'-', T,Y(:,3),'-');grid on
    title('sensitivity for');xlabel('Time');ylabel('S(t)');
    legend('k1','k2','k3');end
    end
 end
    

 
