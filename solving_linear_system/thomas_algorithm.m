% Thomas algorithm
% Tridiagonal matrix T = (a, b, c)
% Solve tridiagonal matrix Tx = g
function x = thomas_algorithm(a, b, c, g)
    n = length(b);
    if n - length(a) ~= 1 || n - length(c) ~= 1
        throw(MException('Matrix:UnsupportedShape', 'Only support tridiagonal matrix.'))
    end
    
    for i = 2 : n
        l = a(i - 1) / b(i - 1);
        b(i) = b(i) - l * c(i - 1);
        g(i) = g(i) - l * g(i - 1);
    end
    
    x(n) = g(n) / b(n);
    for i = n - 1 : -1 : 1
        x(i) = (g(i) - c(i) * x(i + 1)) / b(i);
    end
end