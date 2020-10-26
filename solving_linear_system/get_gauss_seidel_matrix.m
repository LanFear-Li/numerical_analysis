% Get Gauss-Seidel iteration matrix
% x(k) = Gx(k - 1) + g
% 
% A = L + D + U
% x(k) = -inv(D + L) * U * x(k - 1) + inv(D + L) * b
function [G, g] = get_gauss_seidel_matrix(A, b)
    L = tril(A, -1);
    U = triu(A, 1);
    D = diag(diag(A));
    
    G = -(D + L) \ U;
    g = (D + L) \ b;
end