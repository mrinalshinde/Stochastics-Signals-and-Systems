clear all;
close all;
clc;

N = 100;
rand ('state',0);
x1 = rand(N,1);
figure()
plot(x1,'LineWidth',2.5)
title('Uniform distribution')
set(gca,'FontSize',22)

randn ('state',0);
z1 = randn(N,1);
figure()
plot(z1,'LineWidth',2.5)
title('Standard normal distribution')
set(gca,'FontSize',22)

x = x1*5 + 2;
z = z1*sqrt(0.004);
xy1 = [x exp(1+x*0.6+z)];

x = x1*4*pi; 
z = z1*sqrt(0.05);
xy2 = [x 2*sin(x+1)+z];

x = x1*5;
z = z1;
xy3 = [x -0.6*x.^3+0.9*x.^2+3*x+4.5+z];

x = x1*5;
z = z1*sqrt(0.004);
xy4 = [x exp(0.3+log(x)*0.5+z)];

x = x1*2*pi;
z = z1*0.5+6; 
xy = [z.*cos(x)+4 z.*sin(x)+2]; 

save dat3_1 xy1 xy2 xy3 xy4 
save dat3_2 xy