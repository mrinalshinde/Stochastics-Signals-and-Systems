function [coefficient, sigma] = LSE(x, y, model, p)
if strcmp(model,'exponential') == 1
    H = [ones(length(x),1) x]; 
   [av, sigma] = getVariance(length(x), H, log(y), p);
    coefficient = exp(av);
    fprintf('\nParameters for Exponential model for degree = %d are:',p)
    fprintf('\na = %f, b = %f, variance = %f', ...
        coefficient(1,:),coefficient(2,:),sigma)
elseif strcmp(model,'power') == 1
    H = [ones(length(x),1) log(x)];
    [av, sigma] = getVariance(length(x), H, log(y), p);
    coefficient(1,:) = exp(av(1)); 
    coefficient(2,:) = av(2);
    fprintf('\n\nParameters for Power model for degree = %d are:',p)
     fprintf('\na = %f, b = %f, variance = %f', ...
        coefficient(1,:),coefficient(2,:),sigma)
elseif strcmp(model,'sine') == 1
    H=[sin(x) cos(x)];
   [av, sigma] = getVariance(length(x), H, y, p);
    coefficient(2,:) = atan(av(2)/av(1));
    coefficient(1,:) = av(1)/cos(coefficient(2,:));
    fprintf('\n\nParameters for Sine model for degree = %d are:',p)
    fprintf('\na = %f, b = %f, variance = %f', ...
        coefficient(1,:),coefficient(2,:),sigma)
elseif strcmp(model,'polynomial') == 1 
    for i = 1:length(x)
        for j = p+1:-1:1
            H(i,j) = (x(i).^(j-1));
        end
    end
    [coefficient, sigma] = getVariance(length(x), H, y, p);
    fprintf('\n\nParameters for Polynomial model for degree = %d are:',p)
    for i = 1:length(coefficient)
         fprintf('\n%f',coefficient(i,:))
    end
    fprintf('\nvariance = %f',sigma)
end

    function [av, sigma] = getVariance(ln, H, y1, order)
       P = H*(inv(H'*H))* H'; 
       PO = eye(ln) - P; 
       av = (inv(H'*H))*H'*y1;
       sigma = y1'*PO'*y1/(ln-(order+1));
    end

end

    
