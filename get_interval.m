function [idx] = get_interval(T, x)
    idx = -1;
    if x < T(1) || x > T(end) %out of bounds
        return
    end
   size(T, 2)
    for i = 1:size(T, 2)-1
        T(i)
        if x >= T(i) && x <= T(i+1)
            idx = i;
            break;
        end
    end
end