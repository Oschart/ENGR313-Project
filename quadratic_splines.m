function [c] = quadratic_splines(x, fx)

n = int16(length(x) - 1); %number of splines
a = zeros(3 * n - 1);
b = zeros(3 * n - 1, 1);

%1st condition
for i = 1:n
    if i == 1
        a(2 * i - 1, 1) = x(i);
        a(2 * i - 1, 2) = 1;
        b(2 * i - 1) = fx(i);
        
        a(2 * i, 1) = x(i + 1);
        a(2 * i, 2) = 1;
        b(2 * i) = fx(i + 1);
    else
        a(2 * i - 1, 3 * i - 3) = x(i) * x(i);    
        a(2 * i - 1, 3 * i - 2) = x(i);
        a(2 * i - 1, 3 * i - 1) = 1;
        b(2 * i - 1) = fx(i);
        
        a(2 * i, 3 * i - 3) = x(i + 1) * x(i + 1);
        a(2 * i, 3 * i - 2) = x(i + 1);
        a(2 * i, 3 * i - 1) = 1;
        b(2 * i) = fx(i + 1);
        
    end
end

%2nd condition
offset = 2 * n;
for i = 1 : n - 1
    if i == 1
        a(i + offset, 1) = 1;
        a(i + offset, 3) = -2 * x(i + 1);
        a(i + offset, 4) = -1;
    else
        t = (i - 1) * 3;
        a(i + offset, t) = 2 * x(i + 1);
        a(i + offset, t + 1) = 1;
        a(i + offset, t + 3) = -2 * x(i + 1);
        a(i + offset, t + 4) = -1;
    end
end

x = gauss(a, b);
c = zeros(n, 3);

for i = 1:n
    if i == 1
        c(i, 2) = x(1);
        c(i, 3) = x(2);
    else
        t = (i - 1) * 3 - 1;
        for j = 1:3
            c(i, j) = x(t + j);    
        end
    end
end