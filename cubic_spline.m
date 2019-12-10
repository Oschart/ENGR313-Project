function [coff] = cubic_spline(x, y, d2y)
    n = length(x);
    for i = 1:n-1
        t1 = d2y(i)/(6*(x(i+1) - x(i)));
        t2 = d2y(i+1)/(6*(x(i+1) - x(i)));
        
        t3 = y(i)/(x(i+1) - x(i));
        t4 = d2y(i)*(x(i+1)-x(i))/6;
        
        t5 = y(i+1)/(x(i+1) - x(i));
        t6 = d2y(i+1)*(x(i+1)-x(i))/6;

        coff(i, 4) = t2-t1;
        
        coff(i, 3) = 3*(x(i+1)*t1 - x(i)*t2);
        
        rem = 3*(x(i)*x(i)*t2 - x(i+1)*x(i+1)*t1);
        coff(i, 2) = rem + (t4 + t5 - (t3 + t6));
        
        pow3_1 = x(i)*x(i)*x(i);
        pow3_2 = x(i+1)*x(i+1)*x(i+1);
        rem1 = pow3_2*t1 - pow3_1*t2;
        coff(i, 1) = rem1 + x(i+1)*(t3 - t4) - x(i)*(t5 - t6);
     
    end
end
