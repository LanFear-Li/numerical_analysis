% Newton interpolation
function u = newton_interpolation(x, y, u)
    n = length(x);
    if length(y) ~= n
        throw(MException('Matrix:UnsupportedShape', 'Vector x and y must be same length.'));
    end
    
    f = newton_divided_difference(x, y);
    
    len_u = length(u);
    for cur = 1 : len_u
        tmp = u(cur);
        u(cur) = 0;
        fact = 1;
        
        for i = 1 : n
            u(cur) = u(cur) + fact * f(1, i);
            fact = fact * (tmp - x(i));
        end
    end
end