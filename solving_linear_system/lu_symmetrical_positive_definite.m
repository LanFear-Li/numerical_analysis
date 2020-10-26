% A = LU
% LU decomposition for symmetrical positive definite matrix
% We can easily prove that, for every Lij,
% Lij = Uji / Ujj
function A = lu_symmetrical_positive_definite(A)
    [r, c] = size(A);
    if r ~= c
        throw(MException('Matrix:UnsupportedShape', 'Only support square matrix.'))
    end
    
    for i = 1 : r
        % U
        j = i : r;
        A(i, j) = A(i, j) - A(i, 1 : i - 1) * A(1 : i - 1, j);
        
        % L
        j = i + 1 : r;
        A(j, i) = (A(i, j) / A(i, i))';
    end
end