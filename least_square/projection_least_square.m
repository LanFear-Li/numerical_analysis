% Use projection matrix to solve least square problem
% Ax=b
% A'Ax=A'b
% x=inv(A'A)*A'b
function x = projection_least_square(A, b)
    x = (A' * A) \ (A' * b); % = inv(A' * A) * A' * b
end
