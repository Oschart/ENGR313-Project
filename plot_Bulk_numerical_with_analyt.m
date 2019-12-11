function []= plot_Bulk_numerical_with_analyt(X, B_numerical, B_analyt)
    fg = figure;
    ax = axes(fg);
    set(0,'DefaultLegendAutoUpdate','off');
    semilogx(ax, X, B_analyt, 'LineWidth', 1, 'Color', 'r');
    
    xlabel("Vg (m^3/kg)");
    ylabel("Constant-Quality Bulk Modulus (kPa)");
    hold on;
    semilogx(ax, X, B_numerical, 'LineWidth', 1, 'Color', 'b');
    
    hold off;
    legend("Analytical", "Numerical");
    title("Bulk Modulus, analytical vs numerical differentiation")
end