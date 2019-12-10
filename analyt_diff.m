function [coff] = analyt_diff(f)
    n = length(f);
    for i = 2:n
        coff(i-1) = f(i)*(i-1);
    end
end