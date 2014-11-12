function x = p2_neg(vector)
    m21 = vector(3);
    m22 = vector(4);
    v2in = vector(9);
    v2out = vector(10);
    
    global lambda vector
    %lambda = [1; 1; 1];
    A2 = [-1 0; 0 1; 0 0];
    tmp_v2 = [v2in; v2out];

    x = -3*(v2in - 4)^2 - (v2out - 1)^2 + v2out*m21 - (m22 - v2in)^2 - m22 + 20 + lambda'*A2*tmp_v2;
    x = -x;
end