clear all
close all
clc

load dat4_1;
tau = 0:5;
[C, cmod] = covfct(AR,tau);
[a, variance] = levindur(C,length(tau));
fprintf('\n \nThe estimated parameters are:')
fprintf('\na1 = %f \na2 = %f \na3 = %f \na4 = %f \na5 = %f',...
    a(1), a(2), a(3), a(4), a(5))
fprintf('\n\nVariance = %f', variance)

function [a,sigma] = levindur(x,p)
[a,sigma] = levinson(x,p);
end

function [c,cmod] = covfct(x, tau) 
n = length(x);
for i = length(tau) : -1 : 1
    co(i) = 0;
    for j = 1 : n-tau(i)
        sum = (x(j+tau(i))-mean(x))*(x(j)-mean(x));
        co(i) = sum+co(i);
    end
    c(i) = (1/n)*co(i);
    cmod(i) = (1/(n-tau(i)))*co(i);
end
end
