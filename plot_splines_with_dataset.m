function [] = plot_splines_with_dataset(Xspline, Yspline, Vg, P, shade_range, leg)
    fg = figure;
    ax = axes(fg);
    set(0,'DefaultLegendAutoUpdate','off')
    semilogx(ax, Vg, P, 'LineWidth', 1);
    title("The Generated Splines vs The Original Dataset");
    xlabel("Vg (m^3/kg)")
    ylabel("P (kPa)")
    
    hold on
    semilogx(ax, Xspline, Yspline, 'LineWidth', 1);
    hold off
    
    legend("Data From Table", leg);
    hold on;
    area(ax, Vg(shade_range), P(shade_range), 'EdgeColor', 'b')
    hold off
end