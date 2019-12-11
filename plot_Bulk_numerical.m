function [] =plot_Bulk_numerical(X, B_analyt)
figure(3)
semilogx(X, B_analyt, 'LineWidth', 1, 'Color', 'r')
xlabel("Vg (m^3/kg)")
ylabel("Constant-Quality Bulk Modulus (kPa")
legend("Analytical")
title("Bulk Modulus using numerical differentiation")
end