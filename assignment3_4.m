clear all
close all
clc

load dat3_1;

for p = 10:-1:1
[a_ply(p), b_ply(p), sigma_ply(p)] = LSE(xy3(:,1),xy3(:,2),'polynomial',p);
end
plotGraph(sigma_ply)

function plotGraph(sigma)
p = 1:10;
plot(p,sigma,'color','r','LineWidth',3)
set(gca,'FontSize',22)
str = 'Variance as a function of polynomial order';
set(gca,'Title',text('String',str,'FontAngle', 'italic', ...
    'FontWeight', 'bold'), ...
         'xlabel',text('String', 'polynomial order (p)', 'FontAngle','italic'),...
         'ylabel',text('String', 'variance','FontAngle','italic'), ...
         'FontSize',26)

end

function [a, b, sigma] = LSE(x, y, model, p)
if strcmp(model,'exponential') == 1
    H = [ones(length(x),1) x]; 
   [av, sigma] = getVariance(length(x), H, log(y), p);
    a1 = exp(av);
    a = a1(1,:);
    b = a1(2,:);
    fprintf('\nParameters for Exponential model for degree = %d are:',p)
    fprintf('\na = %f, b = %f, variance = %f',a,b,sigma)
elseif strcmp(model,'power') == 1
    H = [ones(length(x),1) log(x)];
    [av, sigma] = getVariance(length(x), H, log(y), p);
    a = exp(av(1)); 
    b = av(2);
    fprintf('\n\nParameters for Power model for degree = %d are:',p)
    fprintf('\na = %f, b = %f, variance = %f',a,b,sigma)
elseif strcmp(model,'sine') == 1
    H=[sin(x) cos(x)];
   [av, sigma] = getVariance(length(x), H, y, p);
    b = atan(av(2)/av(1));
    a = av(1)/cos(b);
    fprintf('\n\nParameters for Sine model for degree = %d are:',p)
    fprintf('\na = %f, b = %f, variance = %f',a,b,sigma)
elseif strcmp(model,'polynomial') == 1 
    for i = 1:length(x)
        for j = p+1:-1:1
            H(i,j) = (x(i).^(j-1));
        end
    end
    [av, sigma] = getVariance(length(x), H, y, p);
    a = av(1,:);
    b = av(2,:);
    fprintf('\n\nParameters for Polynomial model for degree = %d are:',p)
    fprintf('\na = %f, b = %f, variance = %f',a,b,sigma)
end

    function [av, sigma] = getVariance(ln, H, y1, order)
       P = H*(inv(H'*H))* H'; 
       PO = eye(ln) - P; 
       av = (inv(H'*H))*H'*y1;
       sigma = y1'*PO'*y1/(ln-(order+1));
    end

end

    


    

    