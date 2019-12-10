clear; clc;

T = readtable('Table.dat');
P = table2array(T(:, 1));
P = flip(P');
Vg = table2array(T(:, 2));
Vg = flip(Vg');
d2y = compute_2nd_deriv(Vg, P);
linSpline = linear_spline(Vg, P);
quadSpline = quadratic_splines(Vg, P);
cubicSpline = cubic_spline(Vg, P, d2y);

data_start = Vg(1)
data_end = Vg(end)

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

g1 = get_interval(Vg, v1)
g2 = get_interval(Vg, v2)
P_v1 = F(cubicSpline(get_interval(Vg, v1)), v1)
P_v2 = F(cubicSpline(get_interval(Vg, v2)), v2)

inner_pts = extract_inner_pts(Vg, v1, v2)
X = [v1 Vg(inner_pts) v2];
Y = [P_v1 P(inner_pts) P_v2];
if length(inner_pts) > 0
    inner_splines = [cubicSpline(inner_pts(1)-1) cubicSpline(inner_pts)];
else 
    inner_splines = cubicSpline(get_interval(Vg, v1));
end
X
Y
inner_splines
Wb_numerical = numerical_int(X, Y);

Wb_analyt = analyt_int_sliced(inner_splines, X);

% UNNIIIIIIIIIIIIT
fprintf('Analytical Boundary Work = %d \n', Wb_analyt);
fprintf('Numerical Boundary Work = %d \n', Wb_numerical);

B = analyt_diff_sliced(inner_splines, X);
iz=linspace(v1,v2,length(Vg));


plot(Vg, P);
%area(iz,P)

