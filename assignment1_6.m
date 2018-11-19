clear all
close all
clc

rand('state',0)
N = input('Choose a length for the uniformly distributed random sequences: ');
randomValues = rand(N,2);
x = randomValues(:,1);
y = randomValues(:,2);
no_insideCircle = 0;
for i = 1:N
    radius = sqrt(x(i,1).^2 +y(i,1).^2);
    if radius <= 1
        no_insideCircle = no_insideCircle + 1;
    end
end
fprintf('Total number of elements inside circle is %d',no_insideCircle)
approxPi = 4.*(no_insideCircle/N);
fprintf('\nApproximate value of pi is %f',approxPi);

     