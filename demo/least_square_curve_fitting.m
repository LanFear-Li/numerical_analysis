% A country's population data between 1790-1950
x = 1790 : 10 : 1950;
y = [3.929, 5.308, 7.24, 9.368, 12.866, 17.069, 23.182, 31.443, 38.558, 50.156, 62.948, 75.995, 91.972, 105.711, 122.775, 131.669, 150.697];

% First: Draw scatter
figure(1);
plot(x, y, 'o');

% Second: Choose models
% Model1: y = a1x^2 + b1x + c1 model
M1 = [(x .^ 2)' x' ones(length(x), 1)];
% Model2: y = ae^bx
% We change it to y = lna + bx = a2x + b2
M2 = [x' ones(length(x), 1)];

% Third: Calculate models
C1 = qr_least_square(M1, y');
C2 = qr_least_square(M2, log(y)');

% Fourth: Do visualization and estimation
figure(2);
y1 = C1(1) .* x .^ 2 + C1(2) .* x + C1(3);
plot(x, y, 'o', x, y1, '-')
fprintf('Model1:\n');
fprintf('R^2: %f\n', estimate_r_squared(y, y1));
fprintf('MSE: %f\n', estimate_mse(y, y1));
figure(3);
y2 = exp(C2(1) .* x + C2(2));
plot(x, y, 'o', x, y2, '-');
fprintf('\nModel2:\n');
fprintf('R^2: %f\n', estimate_r_squared(y, y2));
fprintf('MSE: %f\n', estimate_mse(y, y2));

% Fifth: Choose the best model: Model 1
fprintf('\ny = %fx^2 + %fx + %f\n', C1(1), C1(2), C1(3));
fprintf('Predict population in 2020: %f\n', C1(1) * 2020 ^ 2 + C1(2) * 2020 + C1(3));
