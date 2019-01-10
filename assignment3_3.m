clear all
close all
clc

load dat3_1;
p = input('Input the order of the polynomial:');
[coefficient_exp, sigma_exp] = LSE(xy1(:,1),xy1(:,2),'exponential',1);
[coefficient_sin, sigma_sin] = LSE(xy2(:,1),xy2(:,2),'sine',1) ;
[coefficient_pow, sigma_pow] = LSE(xy4(:,1),xy4(:,2),'power',1);
[coefficient_ply, sigma_ply] = LSE(xy3(:,1),xy3(:,2),'polynomial',p);

