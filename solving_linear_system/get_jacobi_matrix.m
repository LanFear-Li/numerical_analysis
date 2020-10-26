% Get jacobi iteration matrix
% x(k) = Jx(k - 1) + f
% 
% A = L + D + U
% x(k) = -inv(D) * (L + U) * x(k - 1) + inv(D) * b
function [J, f] = get_jacobi_matrix(A, b)
    L = tril(A, -1);
    U = triu(A, 1);
    D = diag(diag(A));
    
    J = -D \ (L + U);
    f = D \ b;
end