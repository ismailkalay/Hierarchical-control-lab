classdef myfun % in myfun.m
methods (Static) % attribute to true
    function x = p1( vector )
    v = vector (1); m1 = vector (2);
    x = -v*v + v*m1 - m1*m1;end
    function x = p2( vector )
    v = vector (1);m2 = vector (3);
    x = -v*v + 2*v*m2 - 3*m2*m2;end
    function x = p( vector )
    v = vector (1);m1 = vector (2);m2 = vector (3);
    a = -v*v + v*m1 - m1*m1;b=-v*v + 2*v*m2 - 3*m2*m2;
    x = a + b;end
end
end