clear all;
close all;
clc

load dat3_1;
figure() 
subplot(2,1,1)
plot(xy1(:,1),xy1(:,2),'.r','MarkerSize',15)
grid on
set(gca,'FontSize',22)
title('Exponential model','FontAngle', 'italic', 'FontWeight', 'bold')
subplot(2,1,2)
semilogy(xy1(:,1),xy1(:,2),'.r','MarkerSize',15)
grid on
set(gca,'FontSize',22)
title('Logarithmic Y scale','FontAngle', 'italic', 'FontWeight', 'bold')
   
figure() 
plot(xy2(:,1),xy2(:,2),'.r','MarkerSize',15)
set(gca,'FontSize',22)
title('Sine model','FontAngle', 'italic', 'FontWeight', 'bold')
   
figure() 
plot(xy3(:,1),xy3(:,2),'.r','MarkerSize',15)
grid on
set(gca,'FontSize',22)
title('Polynomial model','FontAngle', 'italic', 'FontWeight', 'bold')
 
figure()
subplot(2,1,1)
plot(xy4(:,1),xy4(:,2),'.r','MarkerSize',15)
grid on
set(gca,'FontSize',22)
title('Power Model','FontAngle', 'italic', 'FontWeight', 'bold')
subplot(2,1,2)
semilogy(xy4(:,1),xy4(:,2),'.r','MarkerSize',15)
grid on
ytick = 10.^(0:3);
yticklab = cellstr(num2str(round(-log10(ytick(:))), '10^-^%d'));
set(gca,'YTick',ytick,'YTickLabel',yticklab,'TickLabelInterpreter', ...
    'tex','FontSize',22)
title('Logarithmic Y scale','FontAngle', 'italic', 'FontWeight', 'bold')