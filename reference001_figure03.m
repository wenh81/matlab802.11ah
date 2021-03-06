clear;
clc;

transmission_power_10mW =  10; % 10 mW = 10 dBm = -20 dBW
 
distance = 1:10:600; % meter

path_loss = path_loss_rooftop_macro_deployment(distance);

%signal power level yang diterima (Power Rx)
signal_power_rx = transmission_power_10mW - path_loss;

% path loss dengan fading
% umumnya berdasarkan Eb/N0
% jadi harus cari Eb/N0 dulu
% hitung noise
noise_AWGN = -114; % dB
noise_figure = 0; % dB
antenna_gain = 0; % dB
noise_AWGN_figure_temp_gain_dll = noise_AWGN + noise_figure -...
    antenna_gain; % dB
bandwidth_MCS10 = 1; % 1 MHz
bit_rate_MCS10 = 0.15; % 0.15 Mbps
bandwidth_MCS0 = 2; % 2 MHz
bit_rate_MCS0 = 0.30; % 0.3 Mbps

SNR = signal_power_rx - noise_AWGN_figure_temp_gain_dll;
Eb_N0_MCS0 = SNR + 10*log10(bandwidth_MCS0/bit_rate_MCS0);
Eb_N0_MCS10 = SNR + 10*log10(bandwidth_MCS10/bit_rate_MCS10);

BER_MCS0 = qfunc(sqrt(2*10.^(Eb_N0_MCS0/10)));
BER_MCS0 = (1/2)*erfc(sqrt(10.^(Eb_N0_MCS0/10)));
BER_MCS10 = qfunc(sqrt(2*10.^(Eb_N0_MCS10/10)));

figure
semilogy(distance, BER_MCS0,'r-o');
grid on;
hold on;
semilogy(distance, BER_MCS10,'g-*');
title('BER Vs Distance');
xlabel('Distance (m)');
ylabel('BER');
legend('BER (MCS0 AWGN)','BER (MCS10 AWGN)');

