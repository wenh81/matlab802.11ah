﻿# matlab802.11ah
Tujuannya adalah membuat analisis dan simulasi PER vs Distance di 802.11ah.

Landasan pertama adalah dari artikel Bojan Domazetović dkk.[1]. Reproduce untuk figure 1, 2 dan 3.

Paper berikutnya adalah dari artikel Ferrand dkk. [2]. Reproduce untuk figure 6.

Mencoba membuat simulasi dan analisis berdasar [3] untuk menghasilkan BER vs EbN0 pada OFDM BPSK di channel AWGN dan Rayleigh.

Penjelasan file <b>perbandingan_rumus_BER.m</b>:

Untuk BPSK sudah ada rumus untuk menghitung BER berdasar EbN0 maupun SNR.
Dan rumus ini berlaku untuk OFDM juga.

BER AWGN = 0.5 * erfc(sqrt(EbN0))

BER AWGN = qfunc(sqrt(2EbN0))

BER Rayleigh = 0.5 * (1-sqrt(EbN0/(EbN0+1)))  

BER AWGN = qfunc(sqrt(SNR))

BER AWGN = 0.5*erfc(sqrt(SNR/2))

References:

[1] B. Domazetovic, E. Kocan, and A. Mihovska, “Performance evaluation of IEEE 802.11ah systems,” presented at the 2016 24th Telecommunications Forum (TELFOR), Belgrade, Serbia, 2016, pp. 1–4.

[2] P. Ferrand, J.-M. Gorce, and C. Goursaud, “Approximations of the packet error rate under slow fading in direct and relayed links,” RESEARCH REPORT N° 8316, INRIA, p. 23, 2013.

[3] http://www.dsplog.com/2008/06/10/ofdm-bpsk-bit-error/
