clear; clc;

x = [3, 4.5, 7, 9];
y = [2.5, 1, 2.5, 0.5];

a = compute_2nd_deriv(x, y)

b = cubic_spline(x, y, a)

idx = get_interval(x,5)
b2 = b(2,:)

Pr = P(b(idx, :), 5)