clear all
close all
clc

load dat4_1
tau = 0 : 10;
[C, cmod] = covfct(AR, tau); 
for i = 5 : -1 :1
    x(i)=C(i);
    c(i)=C(i+1);
end
M = toeplitz(x);
a = -M\c'; 
variance = x(1) + c*a;
fprintf('The first 11 values of the sample covariance are:')
for i = 1 : 1 : 11
    fprintf('\nC_xx(%d) = %f',i-1,C(i))
end

fprintf('\n \nThe estimated parameters are:')
fprintf('\na1 = %f \na2 = %f \na3 = %f \na4 = %f \na5 = %f',...
    a(1), a(2), a(3), a(4), a(5))
fprintf('\n\nVariance = %f', variance)

fprintf('\n\nThe coefficient matrix is:')
fprintf('\n')
disp(M)
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