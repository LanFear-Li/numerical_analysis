% Solve least square problem using QR Decomposition
% Ax=b
% QRx=b
% Rx=Q'b
function x = qr_least_square(A, b)
    [n, m] = size(A);
    [Q, R] = qr_decomposition(A);
    % Shape checking is done in qr_decomposition, ignore here
    assert(n >= m);
    
    b = Q' * b;
    R = R(1 : m, :);
    b = b(1 : m, :);
    
    x = solve_upper_triangular_matrix(R, b);
end