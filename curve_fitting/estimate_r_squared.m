% Estimate coefficient of determination
function r_squared = estimate_r_squared(y_observed, y_predicted)
    r_squared = 1 - sum((y_observed - y_predicted) .^ 2) / var(y_observed);
end