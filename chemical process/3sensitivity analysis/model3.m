classdef model3    
 methods (Static)
    function Dy = biochemical(t,y)
        % constants chemical process
        global k1v k2v k3v
        k1=0.17;k2=0.02;k3=0.23;      
        Snom=y(1);Enom=y(2);Cnom=y(3);Pnom=y(4);
        Dy=[-k1*Snom*Enom+k2*Cnom;    %S 
        -k1*Snom*Enom+(k2+k3)*Cnom;   %E 
        k1*Snom*Enom-(k2+k3)*Cnom;    %C 
        k3*Cnom;                      %P 
        %variants
        -k1*Enom*y(5)-k1*Snom*y(6)+k2*y(7)-Snom*Enom*k1v+Cnom*k2v;            %S          
        -k1*Enom*y(5)-k1*Snom*y(6)+y(7)*(k2+k3)-Snom*Enom*k1v+Cnom*(k2v+k3v); %E          
        k1*Enom*y(5)+k1*Snom*y(6)-y(7)*(k2+k3)+Snom*Enom*k1v-Cnom*(k2v+k3v);  %C 
        k3*y(7)+Cnom*k3v;];                                                   %P
    end 
   function Plotchemical(T,Y)
    plot(T,Y(:,1),'-', T,Y(:,2),'-', T,Y(:,3),'-'); grid on;
    title(['sensitivity for']);xlabel('Time');ylabel('S(t)');
    legend('k1','k2','k3');end
    end
end
 
