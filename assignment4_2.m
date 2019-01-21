clear all
close all
clc

load dat1_2;
a = [1 0.5 0.3 0.1 0.7 0.3];
figure()
impz(a);
set(gca,'FontSize',20)
b = 1;
AR = filter(b,a,x1);
save dat4_1 x1 AR