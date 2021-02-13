function [a_next, z_next] = fc(w, a)
    f = @(s) (s>0).*s; 
    z_next = w * a;
    a_next = f(z_next);
end
