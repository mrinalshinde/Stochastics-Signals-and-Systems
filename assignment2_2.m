clear all
close all
clc

alpha = 1/2;
load dat1_1; 
uniformly_dist = -2 * log(x);
n = 0:0.2:10;
[estimated_x, location] = density (uniformly_dist,n);
theoretical_x = 0.5 * exp((-0.5)*n); 
plotGraphs(estimated_x,location,theoretical_x, ...
    'Exponential density function');

fprintf('Mean:')
fprintf('\n Theoretical value = %f', 1/alpha)
fprintf('\n Expected value = %s',num2str(mean(uniformly_dist)))
fprintf('\n\n Variance:')
fprintf('\n Theoretical value = %f',1/alpha^2)
fprintf('\n Estimated value = %f',var(uniformly_dist))

function [rho,location] = density(randomVariable,bins)
[height,location] = hist(randomVariable,bins);  
delta = location(2)-location(1);  
rho = height/(delta*length(randomVariable));  
end

function plotGraphs(rho,location,theoretical,str)
figure()
bar(location,rho,'FaceColor',[0.9290, 0.6940, 0.1250], ...
    'EdgeColor','k','LineWidth',1)
set(gca,'Title',text('String',str,'FontAngle', 'italic', ...
    'FontWeight', 'bold'), ...
         'xlabel',text('String', 'range', 'FontAngle','italic'),...
         'ylabel',text('String', 'density','FontAngle','italic'), ...
         'FontSize',26)
hold on
grid on
plot(location,rho,'r',location,theoretical,'--','LineWidth',3.0);
legend('Estimated value (bar graph)','Estimated value (line graph)', ...
    'Theoritical value');
hold off
end