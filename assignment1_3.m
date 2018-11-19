clear all
close all
clc

load dat1_1;
load dat1_2;
y = linspace(0,1,length(x));
y1 = linspace(0,1,length(x1));
z = sort(x);
z1 = sort(x1);
figure()
plot(z,y,'LineWidth',2)
set(gca,'FontSize',20)
hold on
plot(z1,y1,'LineWidth',2)
xlabel('X')
ylabel('F(X)')
grid on
title('Distribution function')
legend('Uniform distribution','Normal distribution')
