% Get pchip derivative
function d = get_pchip_derivative(x, y)
    n = length(x);
    if n ~= length(y)
        throw(MException('Matrix:UnsupportedShape', 'Vector x and y must be same length.'));
    end
    
    % TODO: Optimize these stuff
    
    % Calculate internal points (between 1 to n, not including)
    d = zeros(1, n);
    h = diff(x);
    first_divided_difference = diff(y) ./ h;
    % Easy to understand!
    for i = 2 : n - 1
        if sign(first_divided_difference(i)) * sign(first_divided_difference(i - 1)) <= 0
            d(i) = 0;
        else
            w1 = 2 * h(i) + h(i - 1);
            w2 = 2 * h(i - 1) + h(i);
            d(i) = (w1 + w2) / (w1 / first_divided_difference(i - 1) + w2 / first_divided_difference(i));
        end
    end
    
    % Calculate endpoints
    d(1) = get_pchip_endpoint_derivative(h(1), h(2), first_divided_difference(1), first_divided_difference(2));
    d(n) = get_pchip_endpoint_derivative(h(n - 1), h(n - 2), first_divided_difference(n - 1), first_divided_difference(n - 2));
end

% Get pchip endpoint derivative
function d = get_pchip_endpoint_derivative(hp, hq, first_divided_difference_p, first_divided_difference_q)
    % TODO: Understand how these formula work
    d = ((2 * hp + hq) * first_divided_difference_p - hp * first_divided_difference_q) / (hp + hq);
    if sign(d) ~= sign(first_divided_difference_p)
        d = 0;
    elseif sign(first_divided_difference_p) ~= sign(first_divided_difference_q) && (abs(d) > abs(3 * first_divided_difference_p))
        d = 3 * first_divided_difference_p;
    end
end