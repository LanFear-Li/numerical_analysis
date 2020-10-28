n = 10000;

x = -1 : (2 / n) : 1;
y = 1 ./ (1 + 25 * x .* x);

sample_x = x(1 : 500 : n);
sample_y = y(1 : 500 : n);

interp_y = pchip_interpolation(sample_x, sample_y, x);

plot(x, y, '-', sample_x, sample_y, 'o', x, interp_y, '--')
axis([-1, 1, 0, 2]);
