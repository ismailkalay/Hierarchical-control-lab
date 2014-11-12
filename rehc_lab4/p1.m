function x = p1(vector)
    m11 = vector(1);
    m12 = vector(2);
    v1in = vector(7);
    v1out = vector(8);
  
    global lambda;
    lambda = [1; 1; 1];
    A1 = [0 1; 0 0; -1 0];
    tmp_v1 = [v1in; v1out];
    
    x = -(v1in - 2)^2 - 2*(v1out - 3)^2 - v1in*m12 - (m11 - v1out)^2 + m11 + 40 + lambda'*A1*tmp_v1;
end