function [] = plot_cubic_splines_with_dataset(Xspline, Yspline, Vg, P, shade_range)
    fg = figure
    ax = axes(fg)
    set(0,'DefaultLegendAutoUpdate','off')
    semilogx(ax, Vg, P, 'LineWidth', 1);
    xlabel("Vg (m^3/kg)")
    ylabel("P (kPa)")
    
    hold on
    semilogx(ax, Xspline, Yspline, 'LineWidth', 1);
    hold off
    
    legend("Data From Table", "Cubic Splines");
    hold on;
    area(ax, Vg(shade_range), P(shade_range), 'EdgeColor', 'b')
    hold off
    title("The Generated Cubic Splines vs The Original Dataset")
end