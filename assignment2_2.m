clear all
close all
clc

alpha = 1/2;
load dat1_1; 
exponential_dist = -2 * log(x);
n = 0:0.2:10;
[estimated_x, location, theoretical_x] = density (exponential_dist); 
plotGraphs(estimated_x,location,theoretical_x, ...
    'Exponential density function');
display_results(exponential_dist, alpha);

function [estimated,location,theoretical] = density(randomVariable)
%theoretical
n = 0:0.2:10;
theoretical = 0.5 * exp((-0.5)*n); 
%estimated
[height,location] = hist(randomVariable,n);  
delta = location(2)-location(1);  
estimated = height/(delta*length(randomVariable));  
end

function plotGraphs(estimated,location,theoretical,str)
figure()
bar(location,estimated,'FaceColor',[0.9290, 0.6940, 0.1250], ...
    'EdgeColor','k','LineWidth',1)
set(gca,'Title',text('String',str,'FontAngle', 'italic', ...
    'FontWeight', 'bold'), ...
         'xlabel',text('String', 'range', 'FontAngle','italic'),...
         'ylabel',text('String', 'density','FontAngle','italic'), ...
         'FontSize',26)
hold on
grid on
plot(location,estimated,'r',location,theoretical,'--','LineWidth',3.0);
legend('Estimated value (bar graph)','Estimated value (line graph)', ...
    'Theoritical value');
hold off
end

function display_results(dist, alpha)
fprintf('Mean:')
fprintf('\n Theoretical value = %f', 1/alpha)
fprintf('\n Expected value = %s',num2str(mean(dist)))
fprintf('\n\n Variance:')
fprintf('\n Theoretical value = %f',1/alpha^2)
fprintf('\n Estimated value = %f',var(dist))

end