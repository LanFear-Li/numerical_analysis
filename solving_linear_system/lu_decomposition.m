% A = LU
% LU = lu_decomposition(A)
%
% LU is a "compressed" matrix, which means L - diag(L) + U,
% Because L is a unit lower triangular matrix, and U is an upper tria-
% ngular matrix, we can "compress" the matrices [L, U] to only one
% matrix - LU
function A = lu_decomposition(A)
    [r, c] = size(A);
    if r > c
        throw(MException('Matrix:UnsupportedShape', 'Only support square matrix or augmented matrix.'))
    end
    
    for i = 1 : r
        % U (and augmented columns)
        j = i : c;
        A(i, j) = A(i, j) - A(i, 1 : i - 1) * A(1 : i - 1, j);
        
        % L
        j = i + 1 : r;
        A(j, i) = (A(j, i) - A(j, 1 : i - 1) * A(1 : i - 1, i)) / A(i, i);
    end
end