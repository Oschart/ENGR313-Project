function []= plot_Bulk_numerical_with_analyt(X, B_analyt)
figure(5)
semilogx(X, B_analyt, 'LineWidth', 1, 'Color', 'r')
xlabel("Vg (m^3/kg)")
ylabel("Constant-Quality Bulk Modulus (kPa")
legend("Analytical")
semilogx(X, B_numerical, 'LineWidth', 1, 'Color', 'b')
legend("Numerical")
end