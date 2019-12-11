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
neg = 1;    % negating intergral in case endpoints are flipped
while 1
    prompt1 = 'Insert v1: ';
    v1 = input(prompt1);
    prompt2 = 'Insert v2: ';
    v2 = input(prompt2);
    if v1 > v2
        temp = v1;
        v1 = v2;
        v2 = temp;
        neg = -1;
    end
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

Wb_numerical = neg*numerical_int(X, Y);

Wb_analyt = neg*analyt_int_sliced(inner_splines, X);

fprintf('Analytical Boundary Work = %d m^2/s^2\n', Wb_analyt);
fprintf('Numerical Boundary Work = %d m^2/s^2\n', Wb_numerical);

B_analyt = -X.*analyt_diff_sliced(inner_splines, X);
B_numerical = -X.*numerical_diff(inner_splines, X);


Xspline = data_start:0.001:data_end;
first = 1;
for i = 1: length(Xspline)
    Yspline(i) = F(cubicSpline(get_interval(Vg, Xspline(i)), :), Xspline(i));
    if Xspline(i) >= v1 && Xspline(i) <= v2
        if first == 1
            spline_pts(1) = i;
            first = 0;
        else
            spline_pts = [spline_pts i];
        end
        
    end
end
iz=linspace(v1,v2,length(Vg));

plot_dataset_alone(Vg, P, inner_pts);
plot_cubic_splines_alone(Xspline, Yspline, spline_pts);
plot_cubic_splines_with_dataset(Xspline, Yspline, Vg, P, inner_pts);


plot_Bulk_numerical(X, B_analyt);
plot_Bulk_analyt(X, B_numerical);
plot_Bulk_numerical_with_analyt(X, B_analyt);

