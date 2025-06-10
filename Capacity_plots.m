% Plotting
plot(C1, v1, 'LineWidth', 4, 'DisplayName', '1');
hold on;
plot(C10, v10, 'LineWidth', 4, 'DisplayName', '10');
plot(C20, v20, 'LineWidth', 4, 'DisplayName', '20');
plot(C50, v50, 'LineWidth', 4, 'DisplayName', '50');
plot(C80, v80, 'LineWidth', 4, 'DisplayName', '80');
plot(C100, v100, 'LineWidth', 4, 'DisplayName', '100');
%plot(C100, v100, 'LineWidth', 4, 'DisplayName', '100');
%plot(C31, v31, 'LineWidth', 4, 'DisplayName', '31');
%plot(C138, v138, 'LineWidth', 4, 'DisplayName', '138');
%plot(C90, v90, 'LineWidth', 4, 'DisplayName', '90');
%plot(C100, v100, 'LineWidth', 4, 'DisplayName', '100');

hold off;

% Axis labels and title
xlabel('Capacity (mAh/cm^2)');
ylabel('Voltage(V)');
legend('show');
