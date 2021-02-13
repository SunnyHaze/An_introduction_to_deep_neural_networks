function [J] = cost(a, y)
    J = 1/2 * sum((a - y).^2);
end


