function [] = plot_dataset_alone(Vg, P, shade_range)
    fg = figure
    ax = axes(fg)
    semilogx(ax, Vg, P, 'LineWidth', 1);
    set(0,'DefaultLegendAutoUpdate','off')
    
    legend("Data From Table");
    
    xlabel("Vg (m^3/kg)")
    ylabel("P (kPa)")
    hold on;
    area(ax, Vg(shade_range), P(shade_range), 'EdgeColor', 'b')
    hold off
    title("The Original Dataset")
end