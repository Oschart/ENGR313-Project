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

P_v1 = F(cubicSpline(get_interval(Vg, v1), :), v1)
P_v2 = F(cubicSpline(get_interval(Vg, v2), :), v2)


inner_pts = extract_inner_pts(Vg, v1, v2);
X = [v1 Vg(inner_pts) v2]
Y = [P_v1 P(inner_pts) P_v2]

if length(inner_pts) > 0
    inner_splines = [cubicSpline(inner_pts(1)-1, :); cubicSpline(inner_pts, :)];
else 
    inner_splines = cubicSpline(get_interval(Vg, v1), :);
end

Wb_numerical = numerical_int(X, Y);

Wb_analyt = analyt_int_sliced(inner_splines, X);

fprintf('Analytical Boundary Work = %d m^2/s^2\n', Wb_analyt);
fprintf('Numerical Boundary Work = %d m^2/s^2\n', Wb_numerical);

B_analyt = -X.*analyt_diff_sliced(inner_splines, X)
B_numerical = -X.*numerical_diff(inner_splines, X)


Xspline = data_start:0.001:data_end;
for i = 1: length(Xspline)
    Yspline(i) = F(cubicSpline(get_interval(Vg, Xspline(i)), :), Xspline(i));
end
iz=linspace(v1,v2,length(Vg));

figure(1)
plot(Vg, P, 'LineWidth', 1);
xlabel("Vg m^3/kg")
ylabel("P kPA")

hold on
plot(Xspline, Yspline, 'LineWidth', 1);
hold off
legend("Data From Table", "Cubic Splines");

figure(2)
plot(X, B_analyt, 'LineWidth', 1)
xlabel("Vg m^3/kg")
ylabel("Constant-Quality Bulk Modulus")
hold on
plot(X, B_numerical, 'LineWidth', 1)
hold off
legend("Analytical", "Numerical");
%area(iz,P)

