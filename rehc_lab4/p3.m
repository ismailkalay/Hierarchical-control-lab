function x = p3(vector)
    m31 = vector(5);
    m32 = vector(6);
    v3in = vector(11);
    v3out = vector(12);
    
    global lambda;
    lambda = [1; 1; 1];
    A3 = [0 0; -1 0; 0 1];
    tmp_v3 = [v3in; v3out];

    x = -2*(v3in - 5)^2 - 4*(v3out - 1)^2 - v3in*m31 - (m32 - v3out)^2 + m32 + 30 + lambda'*A3*tmp_v3;
end