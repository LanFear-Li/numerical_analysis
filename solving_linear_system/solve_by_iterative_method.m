% Use iterative method to solve linear system
% Calculate x(k) = Bx(k-1) + f
% If p-norm || x(k) - x(k - 1) || < precision
% for more than t times, iteration stops
function x = solve_by_iterative_method(B, f, x0, precision, p_norm, t)
    x = x0;
    success = 0;
    while true
        last_x = x;
        x = B * x + f;
        if norm(last_x - x, p_norm) < precision
            success = success + 1;
            if success >= t
                return
            end
        else
            success = 0;
        end
    end
end