clear; clc;

T = readtable('Table.dat');
P = T(:, 1);
Vg = T(:, 2);
d2y = compute_2nd_deriv(Vg, P);
linSpline = linear_spline(Vg, P);
quadSpline = quad_spline(Vg, P);
cubicSpline = cubic_spline(Vg, P, d2y);

data_start = Vg(1);
data_end = Vg(end);

disp('Welcome!');
while 1
    prompt1 = 'Insert v1: ';
    v1 = input(prompt1);
    prompt2 = 'Insert v2: ';
    v2 = input(prompt2);
    if valid_range(v1, v2, data_start, data_end) == 1
        break;
    else
        disp('Ops, inserted range is not within our data set, try again')
    end
end

P_v1 = F(cubicSpline, v1);
P_v2 = F(cubicSpline, v2);

[X, Y] = extract_inner_pts(Vg, P, v1, v2);
X = [v1 X v2];
Y = [P_v1 Y P_v2];

Wb_numerical = numerical_int(X, Y);

Wb_analyt = analyt_int(P, Vg, v1, v2);
B_range = range_diff(Vg, P, v1, v2);
