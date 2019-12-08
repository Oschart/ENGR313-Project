function [x] = thomas(g, f, e, r)
    n = size(f, 2);
    for k = 2:n
        e(k) = e(k)/f(k-1);
        f(k) = f(k) - e(k)*g(k-1);
    end
    % Fwd Subst.
    for k = 2:n
        r(k) = r(k) - e(k)*r(k-1);
    end
    x(n) = r(n)/f(n);
    for k = n-1:-1:1
        x(k) = (r(k) - g(k)*x(k+1))/f(k);
    end
end