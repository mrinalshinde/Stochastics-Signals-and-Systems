clear all
close all
clc

load dat3_2;
x = mean(xy(:,1));
y = mean(xy(:,2));
[x0,y0,r] = LSE_circle(xy(:,1),xy(:,2),x,y); 
figure()
hold on
plot(xy(:,1),xy(:,2),'.b','MarkerSize',25)
plot(x0,y0,'xr','MarkerSize',15)
hold off
%axis equal
hold on
rectangle('Position',[x0-r,y0-r,2*r,2*r],'Curvature',[1,1],'LineWidth',3);
hold off
set(gca,'Title',text('String','LS-Fit to a circle', ...
    'FontAngle', 'italic','FontWeight', 'bold'), ...
         'xlabel',text('String', 'x', 'FontAngle','italic'),...
         'ylabel',text('String', 'y','FontAngle','italic'), ...
         'FontSize',28,'xdata',-4:12,'ydata',-4:12)
     
fprintf('\nThe fitted circle has:')
fprintf('\ncentre at (%f,%f)',x0,y0)
fprintf('\nradius = %f',r)
