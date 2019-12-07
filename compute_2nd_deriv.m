function [dy2] = compute_2nd_deriv(x, y, n)
    
    f(1) = 2*(x(3) - x(1));
    g(1) = (x(3) - x(2));
    r(1) = (6*(y(3) - y(2)))/(x(3) - x(2)) + (6*(y(1) - y(2))/(x(2) - x(1)));
    for k = 3:n-2
        e(k-1) = x(k) - x(k-1);
        f(k-1) = 2*(x(k+1) - x(k-1));
        g(k-1) = (x(k+1) - x(k));
        r(k-1) = (6*(y(k+1) - y(k)))/(x(k+1) - x(k)) + (6*(y(k-1) - y(k))/(x(k) - x(k-1)));
    end

    e(n-2) = (x(n-1) - x(n-2));
    f(n-2) = 2*(x(n) - x(n-2));
    r(n-2) = (6*(y(n) - y(n-1)))/(x(n) - x(n-1)) + (6*(y(n-2) - y(n-1))/(x(n-1) - x(n-2)));
    dy2 = thomas(g, f, e, r, n-2);
end