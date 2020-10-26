% PA = LU
% [P, LU] = plu_decomposition(A)
%
% The code implements column-pivoting LU decomposition algorithm.
% P is a permutation matrix.
% LU is a "compressed" matrix, which means L - diag(L) + U,
% Because L is a unit lower triangular matrix, and U is an upper tria-
% ngular matrix, we can "compress" the matrices [L, U] to only one
% matrix - LU
function [P, A] = plu_decomposition(A)
    [r, c] = size(A);
    if r > c
        throw(MException('Matrix:UnsupportedShape', 'Only support square matrix or augmented matrix.'))
    end
    
    P = eye(r, r);
    for i = 1 : r
        % Find largest element below A(i, i)
        [~, arg] = max(abs(A(i : r, i)));
        arg = arg + i - 1;
        
        % Swap rows %
        A([i arg], :) = A([arg i], :);
        P([i arg], :) = P([arg i], :);
        
        % U (and augmented columns)
        j = i : c;
        A(i, j) = A(i, j) - A(i, 1 : i - 1) * A(1 : i - 1, j);
        
        % L
        j = i + 1 : r;
        A(j, i) = (A(j, i) - A(j, 1 : i - 1) * A(1 : i - 1, i)) / A(i, i);
    end
end