clear all
close all
clc

if exist('dat1_1.mat','file')
    load dat1_1;
    fprintf('Dimension of x, (N) = %d',length(x)); 
else
    warning('dat1_1 doesnot exist')
    return
end
if exist('dat1_2.mat','file')
    load dat1_2;
    fprintf('\nDimension of x1, (N1) = %d',length(x1)); 
else
    fprintf('\n')
    warning('dat1_2 doesnot exist')
    return
 end
y = linspace(0,1,length(x));
y1 = linspace(0,1,length(x1));
z = sort(x);
z1 = sort(x1);
figure()
plot(z,y,'LineWidth',2)
set(gca,'Title',text('String','Distribution function',...
                     'FontAngle', 'italic', 'FontWeight', 'bold'),...
         'xlabel',text('String', '$\mathbf{X}$', 'Interpreter', 'latex'),...
         'ylabel',text('String', '$\mathbf{F(X)}$', 'Interpreter', 'latex'), ...
         'FontSize',15)
hold on
plot(z1,y1,'LineWidth',2)
xlabel('X')
ylabel('F(X)')
grid on
legend('Uniform distribution','Normal distribution')
