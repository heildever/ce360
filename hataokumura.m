% IEU CE 360 antenna engineering
% hata-okumura model
clc,close all,clear all;
% parameters
d = 1:0.1:3e4; 
hm = 5; 
hb1 = 150;
f = 9e8; 

% Correction Factors
Corr_fac_big = 3.2*(log10(11.75*hm)).^2 - 4.97;
Corr_fac_small =(1.1*log10(f)-0.7)*hm-(1.56*log10(f)-0.8); 

% for urban areas
L_urban_big = 69.55 + 26.16*log10(f) + (44.9 - 6.55*log10(hb1))*log10(d) - 13.82*log10(hb1) - Corr_fac_big;
L_urban_small = 69.55 + 26.16*log10(f) + (44.9 - 6.55*log10(hb1))*log10(d) - 13.82*log10(hb1) - Corr_fac_small;

% for suburban areas
L_suburban = L_urban_big - 2*(log10(f/28)).^2 - 5.4;

% for open areas
L_open = L_urban_big - 4.78*(log10(f)).^2 + 18.33*log10(f) - 40.94;

figure(1); 
plot(d,L_urban_big,'-');hold on; 
semilogx(d, L_urban_small,'--');
semilogx(d, L_suburban,':');
semilogx(d, L_open,'x');
xlabel('distance'),ylabel('Loss in dB'); 
legend('big cities','small cities','suburban areas','open areas');

