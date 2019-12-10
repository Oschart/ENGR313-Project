% This function evaluates a given polynomial f at value x
function [poly] = P(f, x)
    poly = 0;
    pow_x = 1;
  
    for i = 1:length(f)
        poly = poly + pow_x*f(i);
        pow_x = pow_x*x;
    end
end