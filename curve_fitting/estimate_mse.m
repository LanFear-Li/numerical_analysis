% Estimate MSE
function mse = estimate_mse(y_observed, y_predicted)
    mse = sum((y_observed - y_predicted) .^ 2);
end