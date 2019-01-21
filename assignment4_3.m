clear all
close all
clc

load dat4_1
a = 5;
I = eye(length(AR)-a); 
for i = length(AR)-a : -1 :1
    x(i,1) = AR(i+a);
    for j = 1 : a
        H(i,j)= AR(a+i-j);
    end
end
est_a = -(inv(H'*H)) * H' * x;
P_orthogonal = I - H * inv(H'*H) * H';
variance = (x'*P_orthogonal*x)/(length(AR)-2*a);
fprintf('\n The LS-estimation of the parameters:')
fprintf('\na1 = %f \na2 = %f \na3 = %f \na4 = %f \na5 = %f',...
    est_a(1), est_a(2), est_a(3), est_a(4), est_a(5))
fprintf('\n\n Variance = %f', variance)