clear all
close all
clc

load dat3_2;
x = xy(:,1);
y = xy(:,2);
[estx0, esty0, r] = LSE_circle(x, y, mean(x), mean(y));
mx = -4 : 1 : 12; 
my = -6 : 1 : 10;
a = 1;
b = 1; 
X_NCONV = [];
Y_NCONV = [];
X_CONV = [];
Y_CONV = [];
for i = 16 : -1 : 1
    for j = 1 : 17 
        MX(i) = mx(i); 
        MY(j) = my(j); 
        [x0,y0,~] = LSE_circle(x,y,MX(i),MY(j)); 
        u0 = abs(estx0-x0);
        v0 = abs(esty0-y0);
        r1 = sqrt(u0.^2 + v0.^2);
        if r1 > r
            X_NCONV(a) = MX(i); 
            Y_NCONV(a) = MY(j);
            a = a + 1;
        else
            X_CONV(b) = MX(i);
            Y_CONV(b) = MY(j); 
            b = b+1; 
        end
    end
end
figure()
plot(X_NCONV,Y_NCONV,'.r','MarkerSize',15)
hold on;
plot(X_CONV,Y_CONV,'.b','MarkerSize',15)
set(gca,'Title',text('String','LS-Fit to a circle: convergence', ...
    'FontAngle', 'italic','FontWeight', 'bold'), ...
         'xlabel',text('String', 'x', 'FontAngle','italic'),...
         'ylabel',text('String', 'y','FontAngle','italic'), ...
         'FontSize',28)
legend('not converging','converging');  
rectangle('Position',[estx0-r,esty0-r,2*r,2*r],'Curvature',[1,1], ...
    'LineWidth',3); 
axis equal; 
 
