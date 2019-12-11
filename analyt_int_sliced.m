function [val] = analyt_int_sliced(f, X)
    n = size(f, 1);
    val = 0;
    for i = 1:n
        val = val + analyt_int(f(i, :), X(i), X(i+1));
    end
end