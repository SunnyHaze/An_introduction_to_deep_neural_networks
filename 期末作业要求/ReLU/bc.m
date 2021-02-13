function delta = bc(w, z, delta_next)
    f = @(s) max(0,s); 
    df = @(s) (s>0);
    delta = (w' * delta_next) .* df(z);
end
