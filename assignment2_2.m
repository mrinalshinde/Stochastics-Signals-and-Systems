clear all
close all
clc

alpha = 1/2;
load dat1_1; 
std_normal_dist = -2 * log(x);
n = 0:0.2:10;
[estimated_x, location, theoretical_x] = density (std_normal_dist); 
plotGraphs(estimated_x,location,theoretical_x, ...
    'Exponential density function');
display_results(std_normal_dist, alpha);

function [rho,location,theoretical_x] = density(randomVariable)
%theoretical
n = 0:0.2:10;
theoretical_x = 0.5 * exp((-0.5)*n); 
%estimated
[height,location] = hist(randomVariable,n);  
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

function display_results(std_normal_dist, alpha)
fprintf('Mean:')
fprintf('\n Theoretical value = %f', 1/alpha)
fprintf('\n Expected value = %s',num2str(mean(std_normal_dist)))
fprintf('\n\n Variance:')
fprintf('\n Theoretical value = %f',1/alpha^2)
fprintf('\n Estimated value = %f',var(std_normal_dist))

end