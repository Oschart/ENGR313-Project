function [res] = numerical_int( x, y)
% this function uses the trapizoidal method to calculate the value of the
% integral
    n = length(x);
    sum =0;
    for i=2:n-1
        h= (x(i+1)-x(i))/2;
        sum = sum + h*(y(i)+y(i+1));
    end
    h1= (x(2)-x(1))/2;
    val1= h1*(y(1)+y(2));
    hn= (x(n)-x(n-1))/2;
    valn= hn*(y(n)+y(n-1));
    res = val1+valn+2*sum;
    

end
