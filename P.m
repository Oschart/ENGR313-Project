function [pressure] = P(f, x)
    pressure = 0;
    pow_x = 1;
  
    for i = 1:size(f, 2)
        pressure = pressure + pow_x*f(i);
        pow_x = pow_x*x;
    end
end