function [xi, yi] = extract_inner_pts(X, Y, v1, v2)
    n = length(X);
    st = 1;
    en = 1;
    for i = 2:n
        st = i+1;
        if X(i) > v1
            st = i;
            break;
        elseif X(i) == v1
            break;
        end
    end
    for i = st-1:n
        en = i-1;
        if X(i) < v2
            en = i;
            break;
        elseif X(i) == v2
            break;
        end
    end
    if st > en
        xi = [];
        yi = [];
    else
        xi = X(1, st:en);
        yi = Y(1, st:en);
    end
    
    
end