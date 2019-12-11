function [] = plot_splines_alone(Xspline, Yspline, shade_range, leg)
    fg = figure;
    
    ax = axes(fg);
    semilogx(ax, Xspline, Yspline, 'LineWidth', 1);
    title("The Generated Splines");
    set(0,'DefaultLegendAutoUpdate','off')
    
    legend(leg);
    
    xlabel("Vg (m^3/kg)")
    ylabel("P (kPa)")
    hold on;
    area(ax, Xspline(shade_range), Yspline(shade_range), 'EdgeColor', 'b')
    hold off
end