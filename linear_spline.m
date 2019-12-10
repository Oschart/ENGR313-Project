function [coff] = linear_spline(x, y)
    n = length(x);
    for i = 1:n-1
        
        slope = (y(i+1) - y(i))/(x(i+1) - x(i));
        
        coff(i, 1) = y(i) - slope*x(i);
        coff(i, 2) = slope;
    
    end
end