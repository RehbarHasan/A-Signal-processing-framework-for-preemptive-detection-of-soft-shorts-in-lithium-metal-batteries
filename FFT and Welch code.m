% Define parameters
window = hann(128); % Window function for Welch's method
noverlap = 32; % Overlap between segments for Welch's method
nfft = 2048; % FFT length for spectral analysis
fs = 1; % Sampling frequency, assumed to be 1 Hz for this example

% Define common properties for figures
fig_width = 15; % Width of the figure in centimeters
fig_height = 12; % Height of the figure in centimeters
font_size = 14; % Font size for labels and legends

% Initialize arrays to store FFT and Welch PSD data
fft_data = cell(5, 2); % Preallocating for 5 sets of FFT data
welch_data = cell(5, 2); % Preallocating for 5 sets of Welch PSD data

% FFT Analysis and Plotting
figure('Units', 'centimeters', 'Position', [1, 1, fig_width, fig_height]);
hold on;
for i = 1:10 % Assuming there are 5 datasets
    % Placeholder for actual voltage and time data
    v = eval(['v' num2str(i)]);
    t = eval(['t' num2str(i)]);

    % Compute the derivative of voltage with respect to time
    dv_dt = diff(v) ./ diff(t);
    L_dv_dt = length(dv_dt);
    pf_dv_dt = abs(fft(dv_dt, nfft) / L_dv_dt); % Compute FFT
    f_dv_dt = fs / 2 * linspace(0, 1, nfft / 2 + 1); % Frequency vector

    % Scale the y-axis data by multiplying by 1e5
    scaled_pf_dv_dt = pf_dv_dt * 1e5;

    % Save scaled FFT data for external use
    fft_data{i, 1} = f_dv_dt;
    fft_data{i, 2} = scaled_pf_dv_dt(1:nfft/2+1);

    % Plot FFT
    plot(f_dv_dt, scaled_pf_dv_dt(1:nfft/2+1), 'LineWidth', 2, 'DisplayName', ['Cycle ' num2str(i)]);
end
xlabel('Frequency (Hz)', 'FontSize', font_size, 'FontWeight', 'bold');
ylabel('Magnitude (\times10^{-5})', 'FontSize', font_size, 'FontWeight', 'bold');
legend('show');
set(gca, 'FontWeight', 'bold', 'LineWidth', 1.5, 'FontSize', font_size);
hold off;
save('fft_data.mat', 'fft_data'); % Save FFT data

% Welch Plot and Save Data
figure('Units', 'centimeters', 'Position', [1, 1, fig_width, fig_height]); % 8x8 cm figure
hold on;

% Process and plot Welch PSD for each dataset
for i = 1:10  % Adjust according to the number of datasets
    % Sample voltage and time data (replace 'v1', 't1' with actual data variables)
    v = eval(['v' num2str(i)]);
    t = eval(['t' num2str(i)]);

    % Compute dV/dt
    dv_dt = diff(v) ./ diff(t);

    % Compute Welch's PSD
    [Pxx_dv_dt, F_welch] = pwelch(dv_dt, window, noverlap, nfft, fs, 'power');

    % Save data for external plotting
    welch_data{i, 1} = F_welch;
    welch_data{i, 2} = 10*log10(Pxx_dv_dt);

    % Plot Welch PSD
    plot(F_welch, 10*log10(Pxx_dv_dt), 'LineWidth', 2, 'DisplayName', ['Cycle ' num2str(i)]);
end

% Finalize Welch plot
xlabel('Frequency (Hz)', 'FontSize', font_size, 'FontWeight', 'bold');
ylabel('Power/Frequency (dB/Hz)', 'FontSize', font_size, 'FontWeight', 'bold');
legend('show');
set(gca, 'FontWeight', 'bold', 'LineWidth', 1.5, 'FontSize', font_size);
hold off;

% Save Welch PSD data to file
save('welch_data.mat', 'welch_data');
