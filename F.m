% This function evaluates a given polynomial f at value x
function [poly] = F(f, x)
    n = length(x);
    for k = 1:n
        poly(k) = 0;
        pow_x = 1;
        for i = 1:length(f)
            poly(k) = poly(k) + pow_x*f(i);
            pow_x = pow_x*x(k);
        end
    end
    
end