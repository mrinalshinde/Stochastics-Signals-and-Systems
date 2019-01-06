clear all;
close all;
clc

load dat3_2;

xt=-6:1:14;
yt=-8:1:12;
a=1;
k=1;


for i=1:21
    for j=1:21
        x1(i)=xt(i);
        y1(j)=yt(j); 
        [x0,y0,r]=LSE_circle(x1(i),y1(j),xy(:,1),xy(:,2)); 
        if xor(xor(isnan(x0),isnan(y0)),isnan(r))==1
            xd(a)=x1(i);
            yd(a)=y1(j);
            a=a+1;
        else
            xc(k)=x1(i);
            yc(k)=y1(j);
            k=k+1;
        end
    end
end
figure()
hold on
plot(xc,yc,'.g');
%plot(xd,yd,'.r',xc,yc,'.g'); 
%legend('not converging','converging');
%hold
[x0,y0,r]=LSE_circle(mean(xy(:,1)),mean(xy(:,2)),xy(:,1),xy(:,2)); 
rectangle('Position',[x0-r,y0-r,2*r,2*r],'Curvature',[1,1]);
axis equal

function [x0,y0,r] = LSE_circle(mean_x,mean_y,x,y)
err = 1;
count_max = 100;
count = 0;
while (err > 10^-10)  & (count < count_max)
    count = count + 1;
    for i = length(x) : -1 : 1
        r(i) = sqrt((x(i)-mean_x)^2+(y(i)-mean_y)^2);
       % a(i) = r(i)+((x(i)-mean_x)/r(i))*mean_x+((y(i)-mean_y)/r(i))*mean_y; 
        a(i) = (x(i)-mean_x)/r(i);
        b(i) = (y(i)-mean_y)/r(i);
    end
    H = [-a' -b' ones(length(x),1)];
    V = (inv(H'*H))*H'*a';
    x0 = V(1);
    y0 = V(2);
    r = V(3);
    err = abs([x0 y0]-[mean_x mean_y]);
    mean_x = x0;
    mean_y = y0;
end
end