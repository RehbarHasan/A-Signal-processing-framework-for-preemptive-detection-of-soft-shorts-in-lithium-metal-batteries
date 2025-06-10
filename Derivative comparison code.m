
% Compute derivatives
dv_dt = diff(v) ./ diff(t);
dv1_dt1 = diff(v1) ./ diff(t1);

% Time vectors aligned with derivatives
t_dv = t(1:end-1);
t1_dv1 = t1(1:end-1);

% Stack Plot
figure;
subplot(2,1,1);
plot(t_dv, dv_dt, 'LineWidth', 2, 'Color', 'b'); % Plot actual data
ylabel('dV/dt', 'FontSize', 12);
legend('Cycle 80');
set(gca, 'FontSize', 12);
ax1 = gca;
ax1.YAxis.Exponent = 0; % Disable scientific notation on Y-axis
ax1.XAxis.Exponent = 0; % Disable scientific notation on X-axis

subplot(2,1,2);
plot(t1_dv1, dv1_dt1, 'LineWidth', 2, 'Color', 'r'); % Plot actual data
xlabel('Time (s)', 'FontSize', 12);
ylabel('dV1/dt1', 'FontSize', 12);
legend('Cycle 100');
set(gca, 'FontSize', 12);
ax2 = gca;
ax2.YAxis.Exponent = 0; % Disable scientific notation on Y-axis
ax2.XAxis.Exponent = 0; % Disable scientific notation on X-axis

% Combined Plot
figure;
plot(t_dv, dv_dt, 'LineWidth', 2, 'Color', 'b'); % Plot actual data
hold on;
plot(t1_dv1, dv1_dt1, 'LineWidth', 2, 'Color', 'r'); % Plot actual data
xlabel('Time (s)', 'FontSize', 12);
ylabel('dV/dt and dV1/dt1', 'FontSize', 12);
legend('Cycle 80', 'Cycle 100');
set(gca, 'FontSize', 12);
ax3 = gca;
ax3.YAxis.Exponent = 0; % Disable scientific notation on Y-axis
ax3.XAxis.Exponent = 0; % Disable scientific notation on X-axis
hold off;

