function [] =plot_Bulk_analyt(X, B_numerical)
figure(4)
semilogx(X, B_numerical, 'LineWidth', 1, 'Color', 'b')
xlabel("Vg (m^3/kg)")
ylabel("Constant-Quality Bulk Modulus (kPa")
legend("Numerical")

end