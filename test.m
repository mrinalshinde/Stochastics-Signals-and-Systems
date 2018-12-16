clear all;
close all; 
load dat1_1;
y = -2*log(x); % transformation
MeanOfX= mean(y); % Finding the mean of y
VarOfX= var(y); % Finding the variance of y
n = 0:0.2:10;
EstOfX = density (y,n);
ThOfX = 0.5*exp((-0.5)*n);
[H,L] = hist(y,n);
bar(L,EstOfX,'c');
hold on;
plot (L, EstOfX,'r',n,ThOfX,'b','LineWidth',2); 

xlabel('Steps');
ylabel('Density');
grid on;
legend ('Estimated value(Bar)','Estimated value(Line)', 'Theoretical'); 
title('Exponential density function');
function [rho,location] = density(randomVariable,bins)
[height,location] = hist(randomVariable,bins);  
delta = location(2)-location(1);  
rho = height/(delta*length(randomVariable));  
end
