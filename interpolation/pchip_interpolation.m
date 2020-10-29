% Just a wrapper for get_pchip_derivative and hermite_interpolation
% PCHIP interpolation
function res = pchip_interpolation(x, y, u)
    res = hermite_interpolation(x, y, get_pchip_derivative(x, y), u);
end