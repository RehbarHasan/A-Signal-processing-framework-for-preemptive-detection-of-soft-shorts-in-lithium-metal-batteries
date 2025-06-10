% Parameters for the problem
R0 = 100;         % Constant resistance R0
m1 = 1;           % Constant m1 for 1/R1(t)
t1 = 0.2;         % Time offset for R1
tau1 = 1;         % Period for R1
T = 10;           % Final time
C = 1;            % Capacitance C
V_s = 10;         % Source voltage Vs
V_0 = 5;          % Initial voltage V0

% Time vector
t = linspace(0, T, 1000);

% 1/R1(t)
R1_inv = zeros(size(t));
for j = 0:floor(T/tau1)
    idx = (t > (t1 + (j + 4/5) * tau1)) & (t <= (t1 + (j + 1) * tau1));
    R1_inv(idx) = m1;
end

% Total resistance 1/R(t)
R_total_inv = 1/R0 + R1_inv;
R_total = 1 ./ R_total_inv;

% Voltage solution V(t) (Monotonically Decreasing)
V_t = V_s * (1 - exp(-cumtrapz(t, 1./(R_total * C)))) + V_0 * exp(-cumtrapz(t, 1./(R_total * C)));

% Derivative of voltage dV/dt (Periodic Behavior)
dV_dt = (V_s - V_0) ./ (C * R_total) .* exp(-cumtrapz(t, 1./(C * R_total)));

% Plotting
figure;

% Subplot 1: 1/R1(t) vs t
subplot(3, 1, 1);
plot(t, R1_inv, 'LineWidth', 2);
ylabel('1/R_1(t)', 'FontSize', 12);
title('Graph of 1/R_1(t) vs t', 'FontSize', 14);
grid on;

% Subplot 2: V(t) vs t (Monotonically Decreasing)
subplot(3, 1, 2);
plot(t, V_t, 'LineWidth', 2, 'Color', 'b');
ylabel('V(t)', 'FontSize', 12);
title('Graph of V(t) vs t (Monotonically Decreasing)', 'FontSize', 14);
grid on;

% Subplot 3: dV/dt vs t (Periodic Peaks)
subplot(3, 1, 3);
plot(t, dV_dt, 'LineWidth', 2, 'Color', 'r');
xlabel('Time (s)', 'FontSize', 12);
ylabel('dV/dt', 'FontSize', 12);
title('Graph of dV/dt vs t (Periodic Peaks)', 'FontSize', 14);
grid on;

% Adjust plot layout
sgtitle('Combined Plots of 1/R1(t), V(t), and dV/dt vs t', 'FontSize', 16);

