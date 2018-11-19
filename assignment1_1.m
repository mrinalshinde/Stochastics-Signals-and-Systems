clear all
close all
clc

N = 1000;
y = randomSequence(N);
[m1,v1,sd1] = forLoop(y.n, y.x);
[m2,v2,sd2] = usingSumAndLength(y.x);
[m3,v3,sd3] = usingMeanAndConv(y.x);
compare(m1,m2,m3,v1,v2,v3,sd1,sd2,sd3);
 
function y = randomSequence(n)
disp('Generating uniformly distributed random numbers ...')
rand('state',0);
x = rand(1,n);
figure()
plot(x)
set(gca,'Title',text('String','Uniformly distributed random numbers',...
                     'FontAngle', 'italic', 'FontWeight', 'bold'),...
         'xlabel',text('String', 'random numbers', 'FontAngle','italic'),...
         'ylabel',text('String', 'random values', 'FontAngle','italic'), ...
         'FontSize',15)
save dat1_1;
y = load('dat1_1');
disp('Saving the random sequence in dat1_1')
disp('done')
end

function [m1,v1,sd1] = forLoop(n,x)
fprintf('\n Calculation using loop for...end')
m = 0;
for i = 1:n
    m = m + x(1,i);
end 
m1 = m/n;
fprintf('\nMean: %f', m1);
v = 0;
for j = 1:n
    v = (v + (x(1,j)-m1)^2);
end
v1 = v/(n-1);
fprintf('\nVariance: %f', v1);
sd1 = sqrt(v1);
fprintf('\nStandard deviation: %f', sd1);
end

function [m2,v2,sd2] = usingSumAndLength(x)
fprintf('\n\n Calculation using sum and length functions')
Summation = sum(x);
L = length(x);
m2 = Summation/L;
fprintf('\nMean: %f', m2);
v2 = (sum((x-m2).^2))/(L-1);
fprintf('\nVariance: %f', v2);
sd2 = (sqrt(v2));
fprintf('\nStandard deviation: %f', sd2);
end

function [m3,v3,sd3] = usingMeanAndConv(x)
fprintf('\n\n Calculation using mean and conv functions')
m3 = mean(x);
v3 = cov(x);
sd3 = (sqrt(v3));
fprintf('\nMean: %f', m3);
fprintf('\nVariance: %f', v3);
fprintf('\nStandard deviation: %f', sd3);
end

function compare(m1,m2,m3,v1,v2,v3,sd1,sd2,sd3)
fprintf('\n\n Comparision of all three methods')
tolerance = 0.0001;
m = (m1+m2)/2;
v = (v1+v2)/2;
sd = (sd1+sd2)/2;
    if abs(m-m3) < tolerance
        fprintf('\nMean obtained from either of the methods are the same.')
    else
        fprintf('\nMean obtained for each method is different')
    end
    if abs(v-v3) < tolerance
        fprintf('\nVariance obtained from either of the methods are the same.')
    else
        fprintf('\nVariance obtained for each method is different')
    end
    if abs(sd-sd3) < tolerance
        fprintf('\nStandard deviation obtained from either of the methods are the same.')
    else
        fprintf('\nStandard deviation obtained for each method is different')
    end
end
