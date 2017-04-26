% IEU CE 360 antenna engineering
% pathloss modelling
clc, clear all, close all;

% lambda = 0.167; % wavelength for 1800MHz
% Ht = 15 ;  % Trasmitting antenna height in meters   
% Hr = 2 ;  % Receiving antenna heigh in meters
% Hm = 3 ;  % Height of the obstacle in meters
% dt = 1000 ; % distance transmitter - obstacle 
% dr = 4000 ; % distance receiver - obstacle
% % Gt = 9 ; % dBi Transmitting antenna gain 
% % Gr = 2 ; % dBi receiving antenna gain 
% 
% 
% axis = [];
% %pke = [];
% ptr = [];
% pfsl = [];
% 
%  for i=1000:5000
%  d=10^(i/1000);
%  axis =[axis d]; 
%  
%  fspower = (lambda/(4*pi*d))^2 ;
%  trpower = fspower*4*(sin(2*pi*Ht*Hr/(lambda*d)))^2;
%  %kepower = Hm*sqrt(2*(dr+dt)/lambda*dr*dt);
%  ptr = [ptr, 10*log10(trpower)];
%  pfsl = [pfsl, 10*log10(fspower)];
%  %pke = [pke,10*log10(kepower)];   
% end
% semilogx(axis,ptr,axis,pfsl,'.-');

lambda = physconst('LightSpeed')/9e8;
plfs = [];
axis = [];
for d=10:10:1e5;
  axis =[axis d]; 
  L = fspl(d,lambda);
  plfs = [plfs,L];
end
semilogx(axis,plfs);

    

