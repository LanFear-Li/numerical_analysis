% QR Decomposition
function [Q, A] = qr_decomposition(A)
    [n, m] = size(A);
    if n < m
        throw(MException('Matrix:UnsupportedShape', 'Can not perform QR Decomposition on under-determined matrix.'))
    end
    
    Q = eye(n);
    for col = 1 : m
        H = blkdiag(eye(col - 1), get_householder_matrix(A(col : n, col)', 1));
        A = H * A;
        Q = H * Q;
    end
    Q = Q';
end