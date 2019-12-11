function [] =plot_Bulk_analyt(X, B_numerical)
figure;

semilogx(X, B_numerical, 'LineWidth', 1, 'Color', 'b')
title("Bulk Modulus using analytical differentiation");
xlabel("Vg (m^3/kg)")
ylabel("Constant-Quality Bulk Modulus (kPa")
legend("Numerical")

end