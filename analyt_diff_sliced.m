function [diff] = analyt_diff_sliced(f, X)
    n = length(f);
    for i = 1:n
        diff(i) = F(analyt_diff(f(i), X(i)));
    end
    diff(n+1) = F(analyt_diff(f(n), X(n)));
end