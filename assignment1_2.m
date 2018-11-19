clear all
close all
clc

load dat1_1;
bins = input('Number of bins:');
[rho1,location1] = density(x,bins); 
theoretical_uniform = ones(bins);
disp('getting line graph and bar graph for uniform density function...')
plotGraphs(rho1,location1,theoretical_uniform,'Uniform density function');
disp('done')
randn('state',0);
x1 = randn(1000,1);
save dat1_2 x1; 
[rho2,location2] = density(x1,bins);
theoretical_normal = (1/(2*pi)^0.5)*exp(-0.5*((location2).^2));
disp('getting line graph and bar graph for standard normal density function...')
plotGraphs(rho2,location2,theoretical_normal,'Standard normal density function');
disp('done')

function [rho,location] = density(randomVariable,bins)
[height,location] = hist(randomVariable,bins);  
delta = location(2)-location(1);  
rho = height/(delta*length(randomVariable));  
end

function plotGraphs(rho,location,theoretical,str)
figure()
plot(location,rho,location,theoretical,'LineWidth',2);
grid on
set(gca,'FontSize',20)
legend('Estimated value','Theoritical value');
title(str)
figure()
bar(location,rho)
set(gca,'FontSize',20)
title(str)
end