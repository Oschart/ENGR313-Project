function [idx] = get_interval(T, x)
    idx = -1;
    if x < T(1) || x > T(end) %out of bounds
        return
    end
    for i = 1:length(T)-1
        T(i)
        if x >= T(i) && x <= T(i+1)
            idx = i;
            break;
        end
    end
end