clear all
close all
clc

load dat1_3; 
std_normal_dist = (x - mean(x))/var(x);
[estimated_x, location, theoretical_x] = density (std_normal_dist);
plotGraphs(estimated_x,location,theoretical_x, ...
    'Standard normal density function');
display_results(std_normal_dist);


function [estimated,location,theoretical] = density(randomVariable)
% theoretical
n = -4:0.25:4;
theoretical = (1/sqrt(2*pi)) * exp(-(n.^2)/2); 
% estimated
[height,location] = hist(randomVariable,length(n));  
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

function display_results(dist)
fprintf('Mean:')
fprintf('\n Theoretical value = %f',0)
fprintf('\n Expected value = %s',num2str(mean(dist)))
fprintf('\n\n Variance:')
fprintf('\n Theoretical value = %f',1)
fprintf('\n Estimated value = %f',var(dist))
end