clear all
close all
clc

load dat2_1
y1 = sqrt(-2*log(randomSeq_1)) .* sin(2*pi*randomSeq_2);
[estimated_y1, location, theoretical_y1] = density (y1);
plotGraphs(estimated_y1,location,theoretical_y1, ...
    'Normal distribution from uniform distribution');
display_results(y1);


function [estimated,location,theoretical_y1] = density(randomVariable)
%theoretical
k = -5 : 0.5 : 5;
theoretical_y1 = (1/sqrt(2*pi)) * exp(-k.^2/2); 
    
%estimated
[height,location] = hist(randomVariable,length(k));  
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
fprintf('\n Theoretical value = %f', 0)
fprintf('\n Expected value = %s',num2str(mean(dist)))
fprintf('\n\n Variance:')
fprintf('\n Theoretical value = %f',1)
fprintf('\n Estimated value = %s',num2str(var(dist)))
end