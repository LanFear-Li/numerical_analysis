% Solve linear equation Ux=b
function res = solve_upper_triangular_matrix(U, b)
    [r, c] = size(U);
    if r ~= c
        throw(MException('Matrix:UnsupportedShape', 'Only support square matrix.'));
    end
    res = zeros(r, 1);
    
    % Back substitution
    for i = r : -1 : 1
        k = i + 1 : r;
        res(i) = (b(i) - U(i, k) * res(k)) / U(i, i);
    end
end