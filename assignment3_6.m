clear all
close all
clc

load dat3_2;
figure()
hold on
plot(xy(:,1),xy(:,2),'.b','MarkerSize',25)
plot(4,2,'xr','MarkerSize',15)
hold off
set(gca,'FontSize',22)
title('LS - Adjustment to a circle: estimating the center', ...
    'FontAngle', 'italic', 'FontWeight', 'bold')
axis equal