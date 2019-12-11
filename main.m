clear; clc;

T = readtable('Table.dat');
P = table2array(T(:, 1));
P = flip(P');
Vg = table2array(T(:, 2));
Vg = flip(Vg');

d2y = compute_2nd_deriv(Vg, P);
linSpline = linear_spline(Vg, P);
quadSpline = quadratic_spline(Vg, P);
cubicSpline = cubic_spline(Vg, P, d2y);

data_start = Vg(1)
data_end = Vg(end)

disp('Welcome!');

[v1, v2, neg] = take_input(data_start, data_end);

% Fitting Modes:

modeFitSpline{1} = cubicSpline;
modeFitSpline{2} = cubicSpline;
modeFitSpline{3} = quadSpline;
modeFitSpline{4} = linSpline;

splineType{1} = "Cubic Splines";
splineType{2} = "Cubic Splines";
splineType{3} = "Quadratic Splines";
splineType{4} = "Linear Splines";


for m = 1:4
    fprintf('You Are On Mode %d \n', m);
    fitSpline = modeFitSpline{m};
    P1 = F(fitSpline(get_interval(Vg, v1), :), v1)
    P2 = F(fitSpline(get_interval(Vg, v2), :), v2)
    
    
    inner_pts = extract_inner_pts(Vg, v1, v2);
    X = [v1 Vg(inner_pts) v2];
    Y = [P1 P(inner_pts) P2];
    
    if length(inner_pts) > 0
        inner_eqs = [fitSpline(inner_pts(1)-1, :); fitSpline(inner_pts, :)];
    else
        inner_eqs = fitSpline(get_interval(Vg, v1), :);
    end
    
    if m ~= 2       % 2 is the only mode requiring all diff & int be done not through the splines
        Wb_numerical = neg*numerical_spline_int(fitSpline, Vg, v1, v2);
        
    else
        Wb_numerical = neg*numerical_int(X, Y);
    end
    
    
    Wb_analyt = neg*analyt_int_sliced(inner_eqs, X);
    
    fprintf('Analytical Boundary Work = %d m^2/s^2\n', Wb_analyt);
    fprintf('Numerical Boundary Work = %d m^2/s^2\n', Wb_numerical);
    
    B_analyt = -X.*analyt_diff_sliced(inner_eqs, X);
    B_numerical = -X.*numerical_diff(inner_eqs, X);
    
    
    % Generate many data points for splines to show the slight difference
    % with the table data points
    Xspline = data_start:0.001:data_end;
    first = 1;
    for i = 1: length(Xspline)
        Yspline(i) = F(fitSpline(get_interval(Vg, Xspline(i)), :), Xspline(i));
        if Xspline(i) >= v1 && Xspline(i) <= v2
            if first == 1
                spline_pts(1) = i;
                first = 0;
            else
                spline_pts = [spline_pts i];
            end
            
        end
    end
    
    prompt = 'Do you wish to display the P-Vg Graphs? insert [Y]es/[N]o ';
    decision = input(prompt, 's');
    if strcmp(decision,'Y') == 1 || strcmp(decision,'y') == 1
        plot_dataset_alone(Vg, P, inner_pts);
        plot_splines_alone(Xspline, Yspline, spline_pts, splineType{m});
        plot_splines_with_dataset(Xspline, Yspline, Vg, P, inner_pts, splineType{m});
    end
    
    prompt = 'Do you wish to Bulk Modulus Graphs? insert [Y]es/[N]o ';
    decision = input(prompt, 's');
    
    if strcmp(decision,'Y') == 1 || strcmp(decision,'y') == 1
        plot_Bulk_numerical(X,B_numerical);
        plot_Bulk_analyt(X, B_analyt);
        plot_Bulk_numerical_with_analyt(X, B_numerical, B_analyt);
    end
    
    
end
