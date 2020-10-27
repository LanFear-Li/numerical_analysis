% Lagrange Interpolation
% lagrange_interpolation([1,2,3],[1,4,9],[10,11])=[100,121]
function res = lagrange_interpolation(x, y, u)
    n = length(x);
    if n ~= length(y)
        throw(MException('Matrix:UnsupportedShape', 'Vector x and y must be same length.'));
    end
    
    res = zeros(size(u));
    len_u = length(u);
    for i = 1 : n
        t = [1 : i - 1 i + 1 : n];
        for cur = 1 : len_u
            res(cur) = res(cur) + y(i) * prod(u(cur) - x(t)) / prod(x(i) - x(t));
        end
    end
end