% Newton Divided Difference
% Given function y = g(x)
% Calculate Newton Divided Difference: f[x1, x2, ..., xn]
function f = newton_divided_difference(x, y)
    n = length(x);
    if length(y) ~= n
        throw(MException('Matrix:UnsupportedShape', 'Vector x and y must be same length.'));
    end
    
    f = zeros(n, n);
    f(1 : n, 1) = y';
    for i = 1 : n - 1
        y = diff(y) ./ (x(i + 1 : n) - x(1 : n - i));
        f(1 : n - i, i + 1) = y';
    end
end