classdef myfun % in myfun.m
methods (Static) % attribute to true
    %Without any coordination method
    function x = p( vector )
    v12 = vector (1);v23 = vector (2);v31 = vector (3);
    m11 = vector (4);m12 = vector (5);m21 = vector (6);m22 = vector (7);m31 = vector (8);m32 = vector (9);
    a = -(v31 - 2)^2 - 2*(v12 - 3)^2 - v31*m12 - (m11 - v12)^2 + m11 + 40;
    b = -3*(v12 - 4)^2 - (v23 - 1)^2 + v23*m21 - (m22 - v12)^2 - m22 + 20;
    c = -2*(v23 - 5)^2 - 4*(v31 - 1)^2 - v23*m31 - (m32 - v31)^2 + m32 + 30;
    x=(a+b+c);x=-x;end
    %Direct method of coordination
    function x = p1( vector )
    v12 = vector (1);v31 = vector (3);m11 = vector (4);m12 = vector (5);
    x = -(v31 - 2)^2 - 2*(v12 - 3)^2 - v31*m12 - (m11 - v12)^2 + m11 + 40;
    x=-x;end
    function x = p2( vector )
    v12 = vector (1);v23 = vector (2);m21 = vector (6);m22 = vector (7);
    x = -3*(v12 - 4)^2 - (v23 - 1)^2 + v23*m21 - (m22 - v12)^2 - m22 + 20;
    x=-x;end
    function x = p3( vector )
    v23 = vector (2);v31 = vector (3);m31 = vector (8);m32 = vector (9);
    x = -2*(v23 - 5)^2 - 4*(v31 - 1)^2 - v23*m31 - (m32 - v31)^2 + m32 + 30;
    x=-x;end
end
end
