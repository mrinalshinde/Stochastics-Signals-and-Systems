clear all
close all
clc

load dat3_2;
figure()
hold on
plot(xy(:,1),xy(:,2),'.b','MarkerSize',28)
plot(4,2,'xr','MarkerSize',18)
hold off
set(gca,'FontSize',26)
title('LS - Adjustment to a circle: estimating the center', ...
    'FontAngle', 'italic', 'FontWeight', 'bold')
axis equal