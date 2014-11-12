classdef myfunc % in myfunc.m
 methods (Static = true)
     %no coordination method function
    function x = p( vector )
    v1in = vector(1); v1out = vector(2);v2in = vector(3); v2out = vector(4);v3in = vector(5); v3out = vector(6);
    m11 = vector(7);m12 = vector(8);m21 = vector(9);m22 = vector(10);m31 = vector(11);m32 = vector(12);
    a = -(v1in-2)^2 - 2*((v1out-3)^2) - v1in*m12 - (m11-v1out)^2 + m11 +40;
    b = -(v2in-2)^2 - 2*((v2out-3)^2) - v2in*m22 - (m21-v2out)^2 + m21 +40;
    c = -(v3in-2)^2 - 2*((v3out-3)^2) - v3in*m32 - (m31-v3out)^2 + m31 +40;
    x=-(a+b+c);
    end
    
    % price method of coordination function    
    function x = p1p( vector )
    v1in = vector(1); v1out = vector(2);m11 = vector(7);m12 = vector(8);
    global lamda 
    A1=[0 1;0 0;-1 0];V1=[v1in;v1out];    
    x = -(v1in-2)^2 - 2*((v1out-3)^2) - v1in*m12 - (m11-v1out)^2 + m11 +40 + transpose(lamda)*A1*V1;
    x=-x;end
    function x = p2p( vector )
    v2in = vector(3); v2out = vector(4);m21 = vector(9);m22 = vector(10);
    global lamda 
    A2=[-1 0;0 1;0 0];V2=[v2in;v2out];
    x = -(v2in-2)^2 - 2*((v2out-3)^2) - v2in*m22 - (m21-v2out)^2 + m21 +40+ transpose(lamda)*A2*V2;
    x=-x;end
    function x = p3p( vector )    
    v3in = vector(5); v3out = vector(6);m31 = vector(11);m32 = vector(12);
    global lamda 
    A3=[0 0;-1 0;0 1];V3=[v3in;v3out];
    x = -(v3in-2)^2 - 2*((v3out-3)^2) - v3in*m32 - (m31-v3out)^2 + m31 +40+ transpose(lamda)*A3*V3;
    x=-x;end
    
    %Direct method of coordination v1out=v2in;v2out=v3in;v3out=v1in;
    function x = p1d( vector )
    v1in = vector(1); v1out = vector(2);m11 = vector(7);m12 = vector(8);
    x = -(v1in-2)^2 - 2*((v1out-3)^2) - v1in*m12 - (m11-v1out)^2 + m11 +40;
    x=-x;end
    function x = p2d( vector )
    v2in = vector(3); v2out = vector(4);m21 = vector(9);m22 = vector(10);
    x = -(v2in-2)^2 - 2*((v2out-3)^2) - v2in*m22 - (m21-v2out)^2 + m21 +40;
    x=-x;end
    function x = p3d( vector )    
    v3in = vector(5); v3out = vector(6);m31 = vector(11);m32 = vector(12);
    x = -(v3in-2)^2 - 2*((v3out-3)^2) - v3in*m32 - (m31-v3out)^2 + m31 +40;
    x=-x;end
    
    function x = pd( vector )%changed v1out=v2in;v2out=v3in;v3out=v1in;
    v1in = vector(1); v1out = vector(2);v2out = vector(3);
    m11 = vector(4);m12 = vector(5);m21 = vector(6);m22 = vector(7);m31 = vector(8);m32 = vector(9);
   
    a = -(v1in-2)^2 - 2*((v1out-3)^2) - v1in*m12 - (m11-v1out)^2 + m11 +40;
    b = -(v1out-2)^2 - 2*((v2out-3)^2) - v1out*m22 - (m21-v2out)^2 + m21 +40;
    c = -(v2out-2)^2 - 2*((v1in-3)^2) - v2out*m32 - (m31-v1in)^2 + m31 +40;
    x=-(a+b+c);
    end    
 end
end
