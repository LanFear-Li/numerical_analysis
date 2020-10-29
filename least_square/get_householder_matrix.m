% Get householder matrix
% x -> Hx, which "reflects" vector x to a coordinate axis
function H = get_householder_matrix(x, k)
    n = length(x);
    sigma = sign(x(k)) * norm(x, 2);
    
    ek = zeros(1, n);
    ek(k) = 1;
    
    u = x + sigma * ek;
    H = eye(n) - 2 * (u' * u) / (u * u');
end