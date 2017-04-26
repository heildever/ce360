% IEU CE 360 antenna engineering
% 2 ray model
clc,close all,clear all;

Gr = 10*log10(2); % receiver gain in dBi
Gt = 10*log10(29); % transmitter gain in dBi 

lambda = 0.167; % wavelength for 1800MHz
Ht=15;  % Trasmitting antenna height     
Hr=2;  % Receiving antenna heigh

axis=[];
p2=[];
pfsl=[];

for i=1000:5000
 d=10^(i/1000);
 axis =[axis d]; 
 
 fspower  = (lambda/(4*pi*d))^2 ;
 power2   = fspower*4*Gt*Gr*(sin(2*pi*Ht*Hr/(lambda*d)))^2;
 p2 =[p2, 10*log10(power2)];
 pfsl=[pfsl, 10*log10(fspower)];
end

semilogx(axis,p2,axis,pfsl,'.-');
  
xlabel('distance in meters');
ylabel('pathloss in dB');
text(1000,-65,'thick line  : free space');
text(1000,-70,'thin line  : 2 ray ground reflection');

text(50,-150,'lambda = 0.167 m');
text(50,-155,'hr = 2 m');
