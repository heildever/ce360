% IEU CE 360 antenna engineering
% knife-edge diffraction 
clc, clear all, close all;
%parameters
d1 = 3e2;
d2 = 7e2;
lambda = 0.167;
Gain = 0;
h = 50; 

v = h*sqrt(2*(d1+d2)/lambda*d1*d2);
    if v <= -1
        Gain = Gain;
    end
    if (-1<=v)&&(v<0)
        Gain = Gain+ 20*log10(.5-.62*v);
    end
    if (0 <=v) && (v<1)
        Gain = Gain+20*log(.5*exp(-.95*v));
    end

    if (1<=v) && (v<2.4)
        Gain = Gain+20*log10(.4-sqrt(.1184-(.38-.1*v)^2));
    end
    if 2.4<=v
        Gain = Gain+ 20*log10(.225/v);
    end
