clear all
close all
clc

load dat3_1;
p = input('Input the order of the polynomial:');
[a_exp, b_exp, sigma_exp] = LSE(xy1(:,1),xy1(:,2),'exponential',1);
[a_sin, b_sin, sigma_sin] = LSE(xy2(:,1),xy2(:,2),'sine',1) ;
[a_pow, b_pow, sigma_pow] = LSE(xy4(:,1),xy4(:,2),'power',1);
[a_ply, b_ply, sigma_ply] = LSE(xy3(:,1),xy3(:,2),'polynomial',p);

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

    