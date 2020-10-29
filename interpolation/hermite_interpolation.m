% Hermite interpolation
function res = hermite_interpolation(x, y, d, u)
    n = length(x);
    if n ~= length(y)
        throw(MException('Matrix:UnsupportedShape', 'Vector x and y must be same length.'));
    end
    if n ~= length(d)
        throw(MException('Matrix:UnsupportedShape', 'Vector d must be same length as vector x and y.'));
    end
    
    k = ones(1, length(u));
    for i = 2 : n - 1
        k(u >= x(i)) = i;
    end

    % TODO: Optimize these stuff
    s = u - x(k);
    h = diff(x);
    h = h(k);
    res = 0;
    res = res + (3 .* h .* s .^ 2 - 2 .* s .^ 3) ./ (h .^ 3) .* y(k + 1);
    res = res + (h .^ 3 - 3 .* h .* s .^ 2 + 2 .* s .^ 3) ./ (h .^ 3) .* y(k);
    res = res + s .^ 2 .* (s - h) ./ h .^ 2 .* d(k + 1);
    res = res + s .* (s - h) .^ 2 ./ h .^ 2 .* d(k);
end