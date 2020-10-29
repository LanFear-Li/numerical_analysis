% Generate scatters around a curve, to test least square algorithms
function [x, y] = generate_curve_scatter(f, from_x, to_x, n, r_off_th)
    if nargin == 4
        r_off_th = (to_x - from_x) / 50;
    end
    x = rand(1, n) * (to_x - from_x) + from_x;
    y = f(x);
    r_off = rand(1, n) * r_off_th;
    theta_off = rand(1, n) * 2 * pi;
    x = x + r_off .* cos(theta_off);
    y = y + r_off .* sin(theta_off);
end