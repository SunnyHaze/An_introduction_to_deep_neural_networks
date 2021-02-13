function [J] = cost(a, y)
    J = 1/2 * sum((a - y).^2);
%     J = -(y.*log(a) + (1-y).*log(1-a)) / length(y);
end


