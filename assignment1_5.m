clear all
close all
clc

load dat1_3;
a = -5:0.125:5;
[X,Y] = meshgrid(a);
F_xy = bivariateFunction(x,y,X,Y);
figure()
mesh(X,Y,F_xy,'LineWidth',1)
set(gca,'Title',text('String','Bivariate Normal Distribution',...
                     'FontAngle', 'italic', 'FontWeight', 'bold'),...
         'xlabel',text('String', '$\mathbf{X}$', 'Interpreter', 'latex'),...
         'ylabel',text('String', '$\mathbf{Y}$', 'Interpreter', 'latex'), ...
         'zlabel',text('String', 'density', 'FontAngle', 'Italic', ...
         'FontWeight', 'bold'),'FontSize',15)
grid on
figure()
contour(X,Y,F_xy,'LineWidth',2.5)
set(gca,'Title',text('String','The Contour of The Bivariate Normal Distribution',...
                     'FontAngle', 'italic', 'FontWeight', 'bold'),...
         'xlabel',text('String', '$\mathbf{X}$', 'Interpreter', 'latex'),...
         'ylabel',text('String', '$\mathbf{Y}$', 'Interpreter', 'latex'), ...
         'FontSize',15)
grid on

function F_xy = bivariateFunction(x,y,X,Y)
[mu_x,mu_y,sigma_x,sigma_y,rho] = getParameters(x,y);
A = 1/(2.*pi.*sigma_x.*sigma_y.*sqrt(1-rho.^2));
B = 1/(2.*(1-rho.^2));
C = ((X-mu_x)/sigma_x).^2;
D = (2.*rho.*(X-mu_x).*(Y-mu_y))/(sigma_x.*sigma_y);
E = ((Y-mu_y)/sigma_y).^2;
F_xy = A.*exp(-B.*(C-D+E));
end

function [mu_x,mu_y,sigma_x,sigma_y,rho] = getParameters(x,y)
mu_x = mean(x);
mu_y = mean(y);
covarianceMatrix = cov(x,y);
sigma_x = sqrt(covarianceMatrix(1,1));
sigma_y = sqrt(covarianceMatrix(2,2));
rho = (covarianceMatrix(1,2) / ...
    sqrt(covarianceMatrix(1,1)*covarianceMatrix(2,2)));
end