clc;clear
format long

NDpiv(0.1581);
NDpiv(0.636);

function NDpiv(x)
    A = [0.79618, 0.77334, 0.74371, 0.70413, 0.65632, 0.60228];
    B = diff(A);
    C = diff(B);
    D = diff(C);
    series = [B(1), C(1), D(1)];
    
    h = 0.125;
    t = (x - h) / h;
    res  = A(1);
    
    cur = 1;
    for i = 1 : 3
        cur = cur * (t - i + 1);
        res = res + series(i) * cur / factorial(i);
       
    end
        fprintf("f(%f) = %f\n", x, res);
end


this file is added for testing
