function [est_x0, est_y0, r] = LSE_circle(x, y, mean_x, mean_y)
err = 1; 
count_max = 100;
count = 0;
while err > 10^-10  && (count < count_max)
    count = count + 1;
    for i = length(x) : -1 : 1 
        c(i) = sqrt((x(i)-mean_x)^2 + (y(i)-mean_y)^2);
        a(i) = (x(i)-mean_x)/c(i);
        b(i) = (y(i)-mean_y)/c(i); 
    end
    H = [ones(length(x),1) a' b'];
    V = (inv(H'*H))*H'*c';
    r = V(1);
    u0 = V(2); 
    v0 = V(3); 
    est_x0 = u0 + mean_x;
    est_y0 = v0 + mean_y;
    err = max(u0,v0);
    mean_x = est_x0;
    mean_y = est_y0;
end
end