clc
clear all
close all
load dat4_1 

for i = 10 : -1 : 1
tau = 0 : i;
[C, cmod] = covfct(AR, tau);
[a{i}, sigma(i)] = levindur(C, length(tau));
if i == 4 || i == 5 || i == 6
    fprintf('\n \nThe estimated parameters for p = %d are:',i)
    fprintf('\n%f',a{i})
    fprintf('\nVariance = %f', sigma(i))
end
Akaike(i) = log(sigma(i)) + i*2/length(AR);
Rissanen(i) = log(sigma(i)) + i*log(length(AR))/length(AR);
end
figure()
hold on
plot(sigma,'--om','LineWidth',2.5,'MarkerSize',10, ...
    'MarkerEdgeColor','k','MarkerFaceColor','m')
plot(Akaike,'--ob','LineWidth',2.5,'MarkerSize',10, ...
    'MarkerEdgeColor','k','MarkerFaceColor','b')
plot(Rissanen,'--or','LineWidth',2.5,'MarkerSize',10, ...
    'MarkerEdgeColor','k','MarkerFaceColor','r')
set(gca,'Title',text('String','Estimation of model order', ...
    'FontAngle', 'italic','FontWeight', 'bold'), ...
         'xlabel',text('String', 'Model order, p', 'FontAngle', ...
         'italic'),'ylabel',text('String','Variance, \sigma', ...
         'FontAngle','italic'),'FontSize',28)
hold off
legend('Estimated Variance','Akaike cretiria','Rissanen cretiria')
hold off

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
