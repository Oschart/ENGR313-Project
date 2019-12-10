function [pts] = extract_inner_pts(T, v1, v2)
    n = length(T);
    st = 1;
    en = 1;
    for i = 2:n
        st = i+1;
        if T(i) > v1
            st = i
            break;
        elseif T(i) == v1
            break;
        end
    end
    for i = st-1:n
        en = i-1;
        if T(i) > v2
            %en = i
            break;
        elseif T(i) == v2
            break;
        end
    end
    if st > en
        pts = [];
    else
        pts = st:1:en;
    end
    
    
end