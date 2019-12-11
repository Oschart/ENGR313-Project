function [] =plot_Bulk_numerical(X, B_analyt)
figure;
semilogx(X, B_analyt, 'LineWidth', 1, 'Color', 'r')
title("Bulk Modulus using numerical differentiation");
xlabel("Vg (m^3/kg)")
ylabel("Constant-Quality Bulk Modulus (kPa")
legend("Analytical")
end