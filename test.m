clear all
close all
clc
%Load data
load dat3_2;
x=xy(:,1);
y=xy(:,2);
meanx=mean(x); 
meany=mean(y);
 
[estx0,esty0,r]=LSE_circle(x,y,meanx,meany);
% Different center values
mx=-4:1:12; 
my=-6:1:10;
a=1;
b=1; 
X_NCONV=[];
Y_NCONV=[];
X_CONV=[];
Y_CONV=[];

%For Loop to check the LS est to a circle   
for i=1:16
    for j=1:17 
        MX(i)=mx(i); 
        MY(j)=my(j); 
        [x0,y0,r1]=LSE_circle(x,y,MX(i),MY(j)); 
        u0=abs(estx0-x0);
        v0=abs(esty0-y0);
        r1=sqrt(u0.^2+v0.^2);
        if r1>r
            X_NCONV(a)=MX(i); 
            Y_NCONV(a)=MY(j);
            a=a+1;
        else
            X_CONV(b)=MX(i);
            Y_CONV(b)=MY(j); 
            b=b+1; 
        
        end
    end
    
end

%Plot
nonconv=plot(X_NCONV,Y_NCONV,'.r');
hold on;
conv=plot(X_CONV,Y_CONV,'.g');
xlabel('x')
ylabel('y')
title('LS-Fit to a circle:convergence');
legend([nonconv conv],'not converging','converging');  
rectangle('Position',[estx0-r,esty0-r,2*r,2*r],'Curvature',[1,1]); 
axis equal; 
 

% LSE_circle function
function [estx0,esty0,r]=LSE_circle(x,y,mx,my)
err=1; 
while err>10^-10
    for i=1:length(x) 
        c(i)=sqrt((x(i)-mx)^2+(y(i)-my)^2);
        a(i)=(x(i)-mx)/c(i);
        b(i)=(y(i)-my)/c(i); 
    end
    X=[ones(length(x),1) a' b'];
    S=(inv(X'*X))*X'*c';
    r=S(1);
    u0=S(2); 
    v0=S(3); 
    estx0=u0+mx;
    esty0=v0+my;
    err=max(u0,v0);
   mx=estx0;
   my=esty0;

end
end