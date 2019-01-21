clear all
close all
clc

load dat1_1 

X = x(1, 1:200);
tau = 0 : 199;
[C,cmod] = covfct(X, tau);
cov_biased = xcov(X,'biased');
cov_unbiased = xcov(X,'unbiased');
for i = 200 : -1 :1
   sample(i+199) = C(i);
   sample(i) = C(200-i+1);
   modified(i+199) = cmod(i);
   modified(i) = cmod(200-i+1);
end
tau = -199 : 199;
getPlot(tau, sample,'Sample Covariance', '','');
getPlot(tau, modified,' Modified Sample Covariance','','');
getPlot(tau, cov_biased,' Biased Covariance','','');
getPlot(tau, cov_unbiased,' Unbiased Covariance','','');
getPlot(sample, cov_biased,...
    'Biased Covariance v/s Sample Covariance', ...
    'Sample Covariance','Biased Covairance');
getPlot(modified, cov_unbiased, ...
    'Unbiased Covariance v/s  Modified Sample Covariance', ...
    ' Modified Sample Covariance ','Unbiased Covariance');

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

function getPlot(x , y, title_str, x_label, y_label)
figure()
plot(x,y,'r','LineWidth',2.5)
set(gca,'Title',text('String',title_str, ...
    'FontAngle', 'italic','FontWeight', 'bold'), ...
         'xlabel',text('String', x_label, 'FontAngle', ...
         'italic'),'ylabel',text('String', y_label, ...
         'FontAngle','italic'),'FontSize',28)
end
