% Piecewise linear interpolation
function res = piecewise_linear_interpolation(x, y, u)
    n = length(x);
    if n ~= length(y)
        throw(MException('Matrix:UnsupportedShape', 'Vector x and y must be same length.'));
    end
    
    delta = diff(y) ./ diff(x);
    
    k = ones(1, length(u));
    for i = 2 : n - 1
        k(u >= x(i)) = i;
    end
    
    res = y(k) + (u - x(k)) .* delta(k);
end