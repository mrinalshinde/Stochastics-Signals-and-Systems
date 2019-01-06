clear all
close all
clc

load dat3_2;
x = mean(xy(:,1));
y = mean(xy(:,2));
[x0,y0,r] = LSE_circle(x,y,xy(:,1),xy(:,2)); 
figure()
hold on
plot(xy(:,1),xy(:,2),'.b','MarkerSize',25)
plot(x0,y0,'xr','MarkerSize',15)
hold off
axis equal
hold on
rectangle('Position',[x0-r,y0-r,2*r,2*r],'Curvature',[1,1],'LineWidth',3);
hold off
title('LS-Fit to a cicle', 'FontAngle', 'italic', 'FontWeight', 'bold')
set(gca,'FontSize',22)
fprintf('\nThe fitted circle has:')
fprintf('\ncentre at (%f,%f)',x0,y0)
fprintf('\nradius = %f',r)


function [x0,y0,r] = LSE_circle(mean_x,mean_y,x,y)
err = 1;
count_max = 100;
count = 0;
while (err > 10^-10)  & (count < count_max)
    count = count + 1;
    for i = length(x) : -1 : 1
        r(i) = sqrt((x(i)-mean_x)^2+(y(i)-mean_y)^2);
        a(i) = r(i)+((x(i)-mean_x)/r(i))*mean_x+((y(i)-mean_y)/r(i))*mean_y; 
        b(i) = -(x(i)-mean_x)/r(i);
        c(i) = -(y(i)-mean_y)/r(i);
    end
    H = [-b' -c' ones(length(x),1)];
    V = (inv(H'*H))*H'*a';
    x0 = V(1);
    y0 = V(2);
    r = V(3);
    err = abs([x0 y0]-[mean_x mean_y]);
    mean_x = x0;
    mean_y = y0;
end
end